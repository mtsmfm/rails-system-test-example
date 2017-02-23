source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

Bundler::Source::Git::GitProxy.prepend(Module.new do
  def git_retry(command)
    if command.start_with?('clone')
      command += " --depth 1 --single-branch --branch #{ref}"
    end

    super(command)
  end
end)

gem 'rails', github: "rails/rails"
gem 'arel', github: "rails/arel"

gem 'pg'
gem 'puma'

group :development, :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
