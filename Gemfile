source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', github: "mtsmfm/rails", branch: "pass-options-to-driven-by"
gem 'pg'
gem 'puma'

group :development, :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'pry-byebug'
end
