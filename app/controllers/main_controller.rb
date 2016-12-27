class MainController < ApplicationController
  def newsfeed
    @post = Post.new(user_id: current_user.id)
    @user_posts = Post.where(user_id: current_user.id)
    render 'main/index'

  end
end
