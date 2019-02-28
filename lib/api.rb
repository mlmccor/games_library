require 'open uri'
require 'json'
require 'net/https'
require 'pry'
class Api
  def run
    http = Net::HTTP.new('api-v3.igdb.com', 80)
    request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-  key' => '643af9abcf6debbaa8e1ef70a734505b'})
    request.body = 'fields name, summary; sort popularity desc; where genres != [13]; where summary != null; limit 50;'
    data = http.request(request).body
    my_array = JSON.parse(data)
    my_array.each do |game|
      Game.create(name: game['name'], summary: game['summary'])
    end
end
