module Otter

  class Error
    attr_reader :code

    def initialize(code)
      @code = code.to_i
    end

    def message
      case self.code
      when 400 then 'Parameter Check Failed'
      when 403 then 'Forbidden'
      when 404 then 'Action Not Supported'
      when 500 then 'Unexpected Internal Error'
      when 503 then 'Temporarily Unavailable'
      else 'Unkown'
      end
    end
  end

end
