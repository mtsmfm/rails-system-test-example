require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  10.times do |i|
    test "visiting the index #{i}" do
      visit posts_url

      assert_selector "h1", text: "Post"

      visit posts_url
    end
  end
end
