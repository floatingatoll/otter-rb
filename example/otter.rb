require 'rubygems'
require 'otter-rb'
require 'pp'

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

  otter.authorsearch('barakobama') do |response, authors|
    pp({
      :total => response.total,
      :page => response.page,
      :perpage => response.perpage,

      :limit => response.rate_limit,
      :remaining => response.rate_remaining,
      :reset => response.rate_reset,

      :authors => authors.map { |author| {
        :name => author.name,
        :type => author.type,
        :nick => author.nick,
        :desc => author.description,
        :url => author.topsy_author_url,
        :influence => author.influence_level
      }}
    })
  end

  otter.linkposts('http://twitter.com/barackobama') do |response, posts|
    pp({
      :total => response.total,
      :page => response.page,
      :perpage => response.perpage,

      :limit => response.rate_limit,
      :remaining => response.rate_remaining,
      :reset => response.rate_reset,

      :posts => posts.map { |post| {
        :permalink => post.permalink_url,
        :target => {
          :topsy_trackback_url => post.target.topsy_trackback_url,
          :url => post.target.url,
          :trackback_total => post.target.trackback_total
        },
        :date => post.date,
        :content => post.content,
        :date_alpha => post.date_alpha
      }}
    })
  end

  otter.linkpostcount('http://twitter.com/topsy') do |response, contains, all|
    pp({
      :contains => contains,
      :all => all
    })
  end

  otter.profilesearch('Barack Obama') do |response, authors|
    pp({
      :total => response.total,
      :page => response.page,
      :perpage => response.perpage,

      :limit => response.rate_limit,
      :remaining => response.rate_remaining,
      :reset => response.rate_reset,

      :authors => authors.map { |author| {
        :url => author.topsy_author_url,
        :name => author.name,
        :topsy_author_url => author.topsy_author_url,
        :photo_url => author.photo_url,
        :desc => author.description,
        :influence => author.influence_level
      }}
    })
  end

  otter.related('http://powerset.com/') do |response, links|
    pp({
      :total => response.total,
      :page => response.page,
      :perpage => response.perpage,

      :limit => response.rate_limit,
      :remaining => response.rate_remaining,
      :reset => response.rate_reset,

      :links => links.map { |link| {
        :topsy_trackback_url => link.topsy_trackback_url,
        :url => link.url,
        :title => link.title,
        :trackback_total => link.trackback_total
      }}
    })
  end

  otter.search('barack obama') do |response, links|
    pp({
      :window => response.window,
      :total => response.total,
      :perpage => response.perpage,
      :page => response.page,
      :links => links.map { |link| {
        :topsy_trackback_url => link.topsy_trackback_url,
        :url => link.url,
        :title => link.title,
        :trackback_total => link.trackback_total,
        :hits => link.hits,
        :content => link.content,
        :score => link.score,
        :highlight => link.highlight
      }}
    })
  end

  otter.searchcount('Barack Obama') do |response, counts|
    pp({
      :hour => counts.hour,
      :day => counts.day,
      :week => counts.week,
      :month => counts.month,
      :all => counts.all
    })
  end

  otter.stats('http://topsy.com/') do |response, topsy_trackback_url, contains, influential, all|
    pp({
      :topsy_trackback_url => topsy_trackback_url,
      :contains => contains,
      :influential => influential,
      :all => all
    })
  end

  otter.tags('http://twitter.com/') do |response, tags|
    pp({
      :total => response.total,
      :perpage => response.perpage,
      :page => response.page,
      :tags => tags.map { |tag| {
        :name => tag.name,
        :url => tag.url
      }}
    })
  end

  otter.trackbacks('http://topsy.com/') do |response, trackbacks|
    pp({
      :total => response.total,
      :perpage => response.perpage,
      :page => response.page,
      :trackbacks => trackbacks.map { |trackback| {
        :permalink_url => trackback.permalink_url,
        :date => trackback.date,
        :content => trackback.content,
        :type => trackback.type,
        :date_alpha => trackback.date_alpha,
        :author => {
          :url => trackback.author.topsy_author_url,
          :name => trackback.author.name,
          :photo_url => trackback.author.photo_url,
          :topsy_author_url => trackback.author.topsy_author_url,
          :influence => trackback.author.influence_level
        }
      }}
    })
  end

  otter.trending do |response, topics|
    pp({
      :total => response.total,
      :perpage => response.perpage,
      :page => response.page,
      :tags => topics.map { |topic| {
        :term => topic.term,
        :url => topic.url
      }}
    })
  end

  otter.urlinfo('http://twitter.com/') do |response, info|
    pp({
      :topsy_trackback_url => info.topsy_trackback_url,
      :oneforty => info.oneforty,
      :url => info.url,
      :title => info.title,
      :trackback_total => info.trackback_total,
      :description => info.description,
      :description_attribution => info.description_attribution
    })
  end
end
