###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
 helpers do
   def blog_gravatar(size=100)
     hash = Digest::MD5.hexdigest(settings.blog_email.downcase)
     "http://www.gravatar.com/avatar/#{hash}?s=#{size}"
   end
 end

set :css_dir, 'stylesheets'

set :js_dir, 'js'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# Livereload
activate :livereload

# Blog configuration
activate :blog do |blog|
  blog.layout    = 'post'
  blog.prefix    = 'posts'
  blog.permalink = ':year/:month/:day/:title'
end

# Blog Settings
set :blog_title, 'Tim Cheadle'
set :blog_email, 'tim@rationalmeans.com'

activate :directory_indexes

# Copy over dotfiles after build
after_build do
  FileUtils.cp_r 'source/.nojekyll', 'build/.nojekyll'
end
