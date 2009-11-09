module Otter

  class Count < Base
    def hour
      Integer(self.data['h'])
    end

    def day
      Integer(self.data['d'])
    end

    def week
      Integer(self.data['w'])
    end

    def month
      Integer(self.data['m'])
    end

    def all
      Integer(self.data['a'])
    end
  end

end
