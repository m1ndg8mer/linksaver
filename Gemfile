source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'haml-rails', '~> 1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mongoid', '~> 6.1.0'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.6'
gem 'sass-rails', '~> 5.0.6'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

gem 'devise'
gem 'kaminari-actionview'
gem 'kaminari-mongoid'
gem 'rails_admin', '~> 1.2'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
