module Slugifiable

  module InstanceMethods

    def slug
      self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

  end


  module ClassMethods

    def find_by_slug(slug)
      self.all.detect do |instance|
        instance.slug == slug
      end
    end

  end

end
