require "application_system_test_case"

module PostsTestExamples
  def self.included(mod)
    mod.instance_eval do
      100.times do |i|
        test "visiting the index #{i}" do
          visit posts_url

          assert_selector "h1", text: "Post"
        end
      end
    end
  end
end

class PostsTestWithHeadlessChrome < ApplicationSystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
    url: "http://chrome:4444/wd/hub",
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: %w(headless disable-gpu window-size=1400x1400)
      }
    )
  }

  include PostsTestExamples
end if ENV["BROWSER"] == 'headless-chrome'

class PostsTestWithChrome < ApplicationSystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {url: "http://chrome:4444/wd/hub"}

  include PostsTestExamples
end if ENV["BROWSER"] == 'chrome'

require 'capybara/poltergeist'
class PostsTestWithPoltergeist < ApplicationSystemTestCase
  driven_by :poltergeist

  include PostsTestExamples
end if ENV["BROWSER"] == 'phantomjs'
