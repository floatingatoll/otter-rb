module Otter

  class Response
    attr_reader :headers,
                :response

    def initialize(headers, response) # :nodoc:
      @headers = headers
      @response = response
    end

    # Total credits that can be allocated.
    def rate_limit
      Integer(self.headers['X_RATELIMIT_LIMIT'])
    end

    # Total credits available.
    def rate_remaining
      Integer(self.headers['X_RATELIMIT_REMAINING'])
    end

    # Time when the credits will be reset.
    def rate_reset
      Time.at(Integer(self.headers['X_RATELIMIT_RESET']))
    end

    # Total number of results
    def total
      Integer(self.response['page'])
    end

    # Current page
    def page
      Integer(self.response['total'])
    end

    # Number of results per page
    def perpage
      Integer(self.response['perpage'])
    end

    def window
      self.response['window']
    end
  end

end
