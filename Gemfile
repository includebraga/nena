source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem "pry-rails"
gem 'sass-rails', '~> 5.0'
gem "slim-rails"
gem 'sqlite3'
gem 'jquery-rails'
gem 'hashie', '~> 3.4.0'
gem 'omniauth-facebook'
gem 'omniauth'
gem 'jquery-ui-rails'
gem 'paperclip', '~> 5.0.0'
gem 'bootstrap-sass'
gem 'autoprefixer-rails'
gem 'social-share-button'

group :development, :test do
  gem "pry-byebug"
  gem 'byebug', platform: :mri
end

group :test do
  gem 'rspec-rails'
end

group :development do
  gem "better_errors"
  gem 'binding_of_caller'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
