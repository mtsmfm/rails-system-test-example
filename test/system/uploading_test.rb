require "application_system_test_case"

class UploadingTest < ApplicationSystemTestCase
  test "uploading" do
    visit new_post_url

    assert_selector "h1", text: "New Post"

    fill_in "Title", with: "Test Post"

    attach_file "File", File.join(fixture_path, "files/test.png")

    click_on "Create Post"

    assert_selector "#notice", text: "Post was successfully created"
  end
end
