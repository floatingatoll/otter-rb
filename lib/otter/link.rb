module Otter

  class Link < Base
    def topsy_trackback_url
      self.data['topsy_trackback_url']
    end

    def url
      self.data['url']
    end

    def title
      self.data['title']
    end

    def trackback_total
      self.data['trackback_total']
    end

    def hits
      Integer(self.data['hits'])
    end
    
    def content
      self.data['content']
    end
    
    def score
      Float(self.data['score'])
    end
    
    def highlight
      self.data['highlight']
    end
  end

end
