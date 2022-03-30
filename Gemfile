source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 4.3'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 5.0'

gem 'railties', '~> 5.2.3'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'rest-client'
gem 'materialize-sass'
gem 'material_icons'

gem 'httparty'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara', '~> 3.15'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
