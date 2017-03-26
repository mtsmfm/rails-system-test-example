class ImagesController < ApplicationController
  def show
    post = Post.where.not(file: nil).find(params[:id])

    send_data post.file, type: 'image/png', disposition: 'inline'
  end
end
