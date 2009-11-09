otter-rb
========

An EventMachine based library for the Topsy Otter API.

Install
-------

otter-rb is hosted on [gemcutter](http://gemcutter.org/gems/otter-rb)

    gem install otter-rb

Example
-------

    require 'rubygems'
    require 'otter-rb'
    Otter.connect('my identification string') do |otter|
      otter.authorinfo('barackobama') do |response, author|
        pp({
          :limit => response.rate_limit,
          :remaining => response.rate_remaining,
          :reset => response.rate_reset,

          :name => author.name,
          :type => author.type,
          :nick => author.nick,
          :desc => author.description,
          :url => author.topsy_author_url,
          :influence => author.influence_level
        })
      end
    end

Copyright
---------

Copyright (c) 2009 Jeff Smick. See LICENSE for details.
