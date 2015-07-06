source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.3'
gem 'enumerate_it'

# DB
gem 'mysql2'

# Assets
gem 'haml'
gem 'rabl'
gem 'jquery-rails'

# Admin
gem 'activeadmin', '~> 1.0.0.pre1'

# Authentication and authorization
gem 'devise'
gem 'cancancan', '~> 1.10'

group :assets do
  gem 'uglifier', '>= 1.3.0'
  gem 'sass-rails', '~> 5.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'therubyracer', platforms: :ruby
  gem 'twitter-bootstrap-rails'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'rspec-rails'
end
