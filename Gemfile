# coding: utf-8
if ENV['USE_OFFICIAL_GEM_SOURCE']
  source 'https://rubygems.org'
else
  source 'http://ruby.taobao.org'
end

gem 'rails', '3.2.16'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'devise'
gem 'figaro'
gem 'breadcrumbs_on_rails', '~> 2.2.0'

# Mongoid
gem 'mongoid', '3.1.4'
gem 'mongoid_auto_increment_id', '0.6.2'
gem 'mongoid_rails_migrations', '0.0.14'

# 上传组件
gem 'carrierwave', '~> 0.10.0'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'carrierwave-upyun', '0.1.8'
gem 'mini_magick','3.7.0', require: false

# Redis 命名空间
gem 'redis-namespace','~> 1.3.1'

# 将一些数据存放入 Redis
gem 'redis-objects', '0.9.1'

# 分享功能
gem 'social-share-button', '0.1.5'

gem 'china_city'
gem 'thin'

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
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
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

# Setting information YAML
gem "settingslogic"

# Markdown 格式 & 文本处理
gem 'redcarpet', '~> 3.0.0'
gem 'rouge', '~> 1.3.4'
gem 'auto-space', '0.0.4'

# Bootstrap
# gem 'bootstrap-sass'
# gem 'bootstrap-will_paginate'
# gem 'bootstrap_helper'
# gem 'autoprefixer-rails'

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