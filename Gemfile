source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.3'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rubocop', require: false
gem 'rubocop-rspec'
gem 'rubocop-rails'

group :development, :test do
	gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
	gem 'spring-watcher-listen', '~> 2.0.0'
	gem 'annotate'
	gem 'bullet'
	gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-doc'
end

group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'active_model_serializers', '~> 0.10.0'
gem 'rspec-rails', '~> 3.5'
gem 'json_spec'
gem 'rack-cors'

gem 'dry-validation'
gem 'dry-transaction'
gem 'will_paginate'