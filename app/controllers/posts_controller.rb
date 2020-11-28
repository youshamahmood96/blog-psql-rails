class PostsController < ApplicationController
    before_action :load_post, only: [:edit, :update, :destroy]
    def index
        @posts =Post.order(created_at: :asc)
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(title:post_params[:title], body:post_params[:body], author:Author.find_by(id: 1))
        if @post.save
            flash[:notice] = 'Post was successfully created'
            redirect_to posts_path
        else
            render :new
        end  
    end
    def edit
    end
    def update
        @post.attributes = post_params
        if @post.save
            redirect_to posts_path
        else
            render :edit
        end
    end
    def destroy
        @post.destroy
        redirect_to posts_path
    end
    private
    def load_post
        @post = Post.find_by(id:params[:id])
    end

    private     
    def post_params
        params.require(:post).permit(:title, :body)
    end 
end