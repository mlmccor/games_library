require 'json'
require 'net/https'
require 'pry'
class Api
  def self.run
    http = Net::HTTP.new('api-v3.igdb.com', 80)
    request = Net::HTTP::Get.new(URI('https://api-v3.igdb.com/games'), {'user-key' => '643af9abcf6debbaa8e1ef70a734505b'})
    request.body = 'fields age_ratings,aggregated_rating,aggregated_rating_count,alternative_names,artworks,bundles,category,collection,cover,created_at,dlcs,expansions,external_games,first_release_date,follows,franchise,franchises,game_engines,game_modes,genres,hypes,involved_companies,keywords,multiplayer_modes,name,parent_game,platforms,player_perspectives,popularity,pulse_count,rating,rating_count,release_dates,screenshots,similar_games,slug,standalone_expansions,status,storyline,summary,tags,themes,time_to_beat,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos,websites;where rating >= 80; sort rating desc; limit 50;'
    data = http.request(request).body
    my_array = JSON.parse(data)
    my_array.each do |game|
      if !game['name'].include?('Assault') && !game['name'].include?('Beach') && !game['name'].include?('Silk')
        Game.create(name: game['name'], summary: game['summary'])
      end
    end

  end
end
