source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0', '>= 5.0.1'

gem 'haml', '~> 4.0.5'

gem 'devise', '~> 4.2'

gem 'paperclip', '~> 5.1'

gem 'simple_form', '~> 3.4'

gem 'masonry-rails', '~> 0.2.4'

gem 'acts_as_votable', '~> 0.10.0'

gem 'kaminari'

gem 'mailboxer', github:'mailboxer/mailboxer'

gem 'searchkick'

gem 'will_paginate'

gem 'redis'

gem 'videojs_rails'

gem 'carrierwave', '~> 1.0'

gem 'mini_magick', '~> 4.6', '>= 4.6.1'

gem 'sunspot_rails'

gem 'sunspot_solr'




gem 'jquery-ui-rails'

gem 'sidekiq'
gem 'sidetiq', github: 'sfroehler/sidetiq', branch: 'celluloid-0-17-compatibility'
gem 'pubnub',  github: 'pubnub/ruby', branch: 'celluloid'
gem 'sinatra', github: 'sinatra/sinatra'

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'

gem 'jquery-turbolinks'

gem 'chartkick'

gem 'bootstrap-filestyle-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem "refile"

gem 'high_voltage', '~> 3.0.0'


# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry'
  gem 'pry-rails'
  gem 'jquery-fileupload-rails'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
