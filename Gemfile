# A sample Gemfile
source "https://rubygems.org"

# gem "rails"
ruby '2.1.3'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'activerecord'
gem 'sinatra-activerecord',:require => 'sinatra/activerecord'
gem 'rake'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end
