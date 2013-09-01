# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://ysdev.realityandapp.com'

SitemapGenerator::Sitemap.create do
  Article.all.each do |c|
    add article_path(c), lastmod: (c.updated_at || c.created_at), :priority => 1
  end

  Commodity.all.each do |c|
    add commodity_path(c), lastmod: (c.updated_at || c.created_at), :priority => 0.9
  end

  Post.all.each do |c|
    add post_path(c), lastmod: (c.updated_at || c.created_at), :priority => 0.9
  end

  Trader.all.each do |c|
    add trader_path(c), lastmod: (c.updated_at || c.created_at), :priority => 0.8
  end

  Group.all.each do |c|
    add group_path(c), lastmod: (c.updated_at || c.created_at), :priority => 0.7
  end

  add download_path, :changefreq => 'weekly', :priority => 0.8
  add posts_path, :changefreq => 'daily', :priority => 0.7
  add commodities_path, :changefreq => 'daily', :priority => 0.7
  add traders_path, :changefreq => 'daily', :priority => 0.6
  add groups_path, :changefreq => 'daily', :priority => 0.6
  add system_contact_path, :changefreq => 'weekly'
  add articles_path, :changefreq => 'daily', :priority => 0.6

  add categories_path
  Commodity.categories.each do |c|
    add category_path(c), :priority => 0.6
  end

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.all.each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
