class Api::V1::PostsController < ApplicationController
  before_action :get_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

   def create
    
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :accepted
    else
      render json: {errors: @post.errors.full_messages, status: :unprocessible_entity}
    end
  end

  def update
    @post.update(post_params)
    render json: @post
  end
  
  def destroy
    post = @post
    @post.destroy
    render json: post
  end


  private
  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:id, :title, :content, :img, :user_id)
  end
end
