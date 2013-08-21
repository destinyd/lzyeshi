require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://ruby.taobao.org'
gem 'rails', '3.2.13'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem "thin", ">= 1.5.0"#, :group => :production
gem 'faye'
gem "mongoid", ">= 3.1.2"
gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "capybara", ">= 2.0.3", :group => :test
gem "database_cleaner", ">= 1.0.0.RC1", :group => :test
gem "mongoid-rspec", ">= 1.7.0", :group => :test
gem "email_spec", ">= 1.4.0", :group => :test
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "bootstrap-sass", ">= 2.3.0.0"
gem "devise", ">= 2.2.3"
gem "cancan", ">= 1.6.9"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.1.0"
gem "quiet_assets", ">= 1.0.2", :group => :development
gem "figaro", ">= 0.6.3"
gem "better_errors", ">= 0.7.2", :group => :development
gem "binding_of_caller", ">= 0.7.1", :group => :development#, :platforms => [:mri_19, :rbx]
case HOST_OS
when /linux/i
  gem "libv8", ">= 3.11.8"
  gem "therubyracer", ">= 0.11.3", :group => :assets, :platform => :ruby, :require => "v8"
end

gem "inherited_resources"
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'money-rails'
gem 'mongoid_taggable_on'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mini_magick', '>= 3.4'
gem 'rack-raw-upload', '>= 1.1.0'
gem 'debugger', git: 'git://github.com/cldwalker/debugger.git', :group => :development
gem 'meta-tags', :require => 'meta_tags',git: 'git://github.com/destinyd/meta-tags.git'
gem "symbolize", :require => "symbolize/mongoid"
gem 'doorkeeper'
gem 'cells'
gem 'rspec-cells', :group => [:development, :test]
gem "crummy", "~> 1.7.1"
gem 'bootstrap-wysihtml5-rails'
gem 'omniauth'
gem 'omniauth-oauth2', git: 'git://github.com/intridea/omniauth-oauth2.git'
gem 'omniauth-baidu-social','>= 0.0.1',
  git: 'git://github.com/destinyd/omniauth-baidu-social.git'

# for lib
gem 'httparty'

# sitemap
gem 'sitemap_generator'

#富文本编辑器
gem 'rails_kindeditor', '~> 0.4.0'
