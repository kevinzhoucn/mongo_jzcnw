#source 'http://ruby.taobao.org'
source 'https://rubygems.org'

gem 'rails', '~> 3.2.16'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'devise'
gem 'figaro'
gem 'mongoid'
gem 'china_city'

group :production do
#  gem 'mysql2'
#  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'quiet_assets'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do

  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  # gem 'therubyracer'
  # gem 'less-rails'
  # gem 'twitter-bootstrap-rails'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require=>false
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'launchy'
  gem 'mongoid-rspec'
end

gem 'sass-rails'
gem 'jquery-rails'
gem 'haml-rails'
gem 'simple_form'
# gem 'will_paginate'
#gem 'bootstrap-sass'
gem 'paperclip', '~> 3.5.3'
gem 'kaminari'
gem 'rails_admin'
gem 'cancan'
gem 'rolify'
#gem 'paperclip', '~> 4.0t'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# This version needs to be hardcoded for OpenShift compatibility
#gem 'thor', '= 0.14.6'

# This needs to be installed so we can run Rails console on OpenShift directly
#gem 'minitest'