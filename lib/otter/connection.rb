module Otter

  class Connection
    def initialize(identifier)
      @identifier = identifier
    end

    def authorinfo(username, &block)
      self.request('authorinfo', {:url => "http://twitter.com/#{username}"}, Author, block)
    end

    def authorsearch(query, window = 'a', page = nil, perpage = nil, &block)
      self.request('authorsearch', {:q => query, :window => window}, Author, block, page, perpage)
    end

    def linkposts(url, contains = nil, page = nil, perpage = nil, &block)
      self.request('linkposts', {:url => url, :contains => contains}, Post, block, page, perpage)
    end

    def linkpostcount(url, contains = nil, &block)
      self.request('linkpostcount', {:url => url, :contains => contains}, Base, lambda { |response, base|
        if response.is_a?(Error)
          block.call response
        else
          block.call response, Integer(base.data['contains']), Integer(base.data['all'])
        end
      })
    end

    def profilesearch(query, page = nil, perpage = nil, &block)
      self.request('profilesearch', {:q => query}, Author, block, page, perpage)
    end

    def related(url, page = nil, perpage = nil, &block)
      self.request('related', {:url => url}, Link, block, page, perpage)
    end

    def search(query, window = 'a', page = nil, perpage = nil, &block)
      self.request('search', {:q => query, :window => window}, Link, block, page, perpage)
    end

    def searchcount(query, &block)
      self.request('searchcount', {:q => query}, Count, block)
    end

    def stats(url, contains = nil, &block)
      self.request('stats', {:url => url, :contains => contains}, Base, lambda { |response, base|
        if response.is_a?(Error)
          block.call response
        else
          block.call( response,
                      base.data['topsy_trackback_url'],
                      Integer(base.data['contains']),
                      Integer(base.data['influential']),
                      Integer(base.data['all']))
        end
      })
    end

    def tags(url, page = nil, perpage = nil, &block)
      self.request('tags', {:url => url}, Tag, block, page, perpage)
    end

    def trackbacks(url, contains = nil, infonly = nil, page = nil, perpage = nil, &block)
      self.request('trackbacks', {:url => url, :contains => contains, :infonly => infonly}, Trackback, block, page, perpage)
    end

    def trending(page = nil, perpage = nil, &block)
      self.request('trending', nil, Topic, block, page, perpage)
    end

    def urlinfo(url, &block)
      self.request('urlinfo', {:url => url}, UrlInfo, block)
    end

  protected
    def request(url, params, klass, callback, page = nil, perpage = nil)
      params[:page] = page if page
      params[:perpage] = perpage if perpage

      http = EM::HttpRequest.new("http://otter.topsy.com/#{url}.json", {'X-Topsy-UA' => @identifier}).get :query => params
      http.callback {
        body = Yajl::Parser.new.parse(http.response)['response']
        callback.call(Response.new(http.response_header, body), klass.create(body))
      }

      http.errback {
        callback.call(Error.new(http.status))
      }
    end
  end

end
