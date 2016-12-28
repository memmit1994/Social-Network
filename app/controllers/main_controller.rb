class MainController < ApplicationController
  def newsfeed
    @post = Post.new(user_id: current_user.id)
    @posts = Post.all
    render 'main/index'

  end

  def add_like
    Post.find(params[:post_id]).liked_by User.find(params[:user_id])
  end
end
