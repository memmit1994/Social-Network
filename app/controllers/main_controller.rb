class MainController < ApplicationController
    def newsfeed
        @post = Post.new(user_id: current_user.id)
        @posts = Post.where(public: true).or(Post.where(user_id: current_user.id))
        render 'main/index'
    end

    def add_like
        Post.find(params[:post_id]).liked_by User.find(params[:user_id])
    end

    def profile
        @user = current_user
    end

    def friends
        @friends = current_user.friends
    end
end
