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
    @post = Post.new(post_params[:post_info])
    
    if @post.save
      post_params[:post_tags_attributes].each do |item_hash|
        @post.post_tags.create(item_hash)
      end
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
    params.require(:post).permit(post_info: [:id, :title, :content, :img, :user_id],  post_tags_attributes: [:id, :post_id, :tag_id] )
  end
end
