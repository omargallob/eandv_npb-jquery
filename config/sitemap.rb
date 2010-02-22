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
  
  # add '/articles'
  Page.find_main.each do |p|
    sitemap.add view_page_path(p.name), :lastmod => p.updated_at
  end
  
  # Properties
  Property.find(:all).each do |a|
    sitemap.add property_path(a), :lastmod => a.updated_at
  end
  
  # Services
  Category.find_main.each do |cat|
    sitemap.add services_par_path(cat), :lastmod => cat.updated_at
    cat.subcategories.each do |sub|
      sitemap.add services_sub_path(cat.name,sub.name), :lastmod => sub.updated_at
    end
  end
  
  
  # add merchant path
  # sitemap.add '/purchase', :priority => 0.7, :host => "https://www.example.com"
  
end

# Including Sitemaps from Rails Engines.
#
# These Sitemaps should be almost identical to a regular Sitemap file except 
# they needn't define their own SitemapGenerator::Sitemap.default_host since
# they will undoubtedly share the host name of the application they belong to.
#
# As an example, say we have a Rails Engine in vendor/plugins/cadability_client
# We can include its Sitemap here as follows:
# 
# file = File.join(Rails.root, 'vendor/plugins/cadability_client/config/sitemap.rb')
# eval(open(file).read, binding, file)
