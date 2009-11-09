module Otter

  class Trackback < Base
    def permalink_url
      self.data['permalink_url']
    end

    def date
      Time.at(Integer(self.data['date']))
    end

    def content
      self.data['content']
    end

    def type
      self.data['type']
    end

    def date_alpha
      self.data['date_alpha']
    end

    def author
      @author ||= Author.new(self.data['author'])
    end
  end

end
