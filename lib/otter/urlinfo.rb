module Otter

  class UrlInfo < Base
    def topsy_trackback_url
      self.data['topsy_trackback_url']
    end


    def oneforty
      self.data['oneforty']
    end

    def url
      self.data['url']
    end

    def title
      self.data['title']
    end

    def trackback_total
      Integer(self.data['trackback_total'])
    end

    def description
      self.data['description']
    end

    def description_attribution
      self.data['description_attribution']
    end
  end

end
