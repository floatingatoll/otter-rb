%w[
  em-http
  yajl

  otter/connection
  otter/response
  otter/error

  otter/base
  otter/author
  otter/post
  otter/link
  otter/count
  otter/tag
  otter/trackback
  otter/topic
  otter/urlinfo
].each { |r| require r }

module Otter

  def self.connect(identifier, &block)
    EM.run {
      yield Connection.new(identifier)
    }
  end

end
