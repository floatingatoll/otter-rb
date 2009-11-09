# "name" : "Barack Obama",
# "url" : "http://twitter.com/barackobama",
# "type" : "twitter",
# "nick" : "barackobama",
# "description" : "44th President of the United States",
# "topsy_author_url" : "http://topsy.com/twitter/barackobama",
# "influence_level" : "5"
module Otter

  class Author < Base

    def name
      self.data['name']
    end

    def type
      self.data['type']
    end

    def nick
      self.data['nick']
    end

    def description
      self.data['description']
    end

    def topsy_author_url
      self.data['topsy_author_url']
    end

    def influence_level
      self.data['influence_level']
    end

    def topsy_author_url
      self.data['topsy_author_url']
    end

    def photo_url
      self.data['photo_url']
    end
  end

end
