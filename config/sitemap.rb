# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://npb.heroku.com"

SitemapGenerator::Sitemap.add_links do |sitemap|
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: sitemap.add path, options
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly', 
  #           :lastmod => Time.now, :host => default_host

  
  # Examples:
  
  # add '/properties'
  sitemap.add properties_path, :priority => 0.7, :changefreq => 'daily'

  # add all individual properties
  Property.find(:all).each do |a|
    sitemap.add property_path(a), :lastmod => a.updated_at
  end
  
  sitemap.add services_path, :priority => 0.7, :changefreq => 'daily'

  Category.find_main.each do |a|
    sitemap.add services_par_path(:category => a.name), :lastmod => a.updated_at
  end
  
  # add merchant path
  #sitemap.add '/purchase', :priority => 0.7, :host => "https://www.example.com"
  
end
