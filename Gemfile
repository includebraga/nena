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

group :development, :test do
  gem "pry-byebug"
  gem 'byebug', platform: :mri
end

group :development do
  gem "better_errors"
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
