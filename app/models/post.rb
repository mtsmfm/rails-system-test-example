class Post < ApplicationRecord
  before_save do |post|
    post.file = post.file&.read
  end
end
