module Otter

  class Topic < Base
    def url
      self.data['url']
    end

    def term
      self.data['term']
    end
  end

end
