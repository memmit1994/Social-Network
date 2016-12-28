class MainController < ApplicationController
    def newsfeed
        @post = Post.new(user_id: current_user.id)
        @posts = Post.where(public: true).or(Post.where(user_id: current_user.id)).order(updated_at: :desc)
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

    def search
        query = "SELECT * FROM users WHERE fname LIKE '%#{params[:search]}%' OR lname LIKE '%#{params[:search]}%' OR nickname LIKE '%#{params[:search]}%' OR email LIKE '%#{params[:search]}%'
                UNION
                SELECT * FROM users WHERE users.hometown_id = (SELECT id FROM hometowns WHERE city LIKE '%#{params[:search]}%')
                UNION
                SELECT * FROM users WHERE users.id = (SELECT user_id FROM posts WHERE content LIKE '%#{params[:search]}%')"
        @users = User.find_by_sql(query)

        print(@users)
    end
end
