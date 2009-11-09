module Otter

  class Post < Base
    def permalink_url
      self.data['permalink_url']
    end

    def target
      @target ||= Target.new(self.data['target'])
    end

    def date
      Time.at(Integer(self.data['date']))
    end

    def content
      self.data['content']
    end

    def date_alpha
      self.data['date_alpha']
    end

    class Target < Base
      def topsy_trackback_url
        self.data['topsy_trackback_url']
      end

      def url
        self.data['url']
      end

      def trackback_total
        Integer(self.data['trackback_total'])
      end
    end  # Target
  end  # Post

end  # Otter
