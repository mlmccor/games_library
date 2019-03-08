module Slugifiable

  module InstanceMethods

    def slug
      if self.class == User
        self.username.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
      else
        self.name.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
      end
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
