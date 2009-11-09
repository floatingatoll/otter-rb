module Otter
  
  class Tag < Base
    def url
      self.data['url']
    end
    
    def name
      self.data['name']
    end
  end
  
end
