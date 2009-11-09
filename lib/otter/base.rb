module Otter

  class Base
    attr_reader :data

    def self.create(data)
      if data['list'].is_a?(Array)
        data['list'].map { |d| self.new(d) }
      else
        self.new(data)
      end
    end

    def initialize(data)
      @data = data
    end
  end

end
