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
        if item_hash[:tag_id].is_a? Integer 
          @post.post_tags.create(item_hash)
        else
          #Creates a new tag and builds association through post_tags
          new_tag = Tag.create(name: item_hash[:tag_id])
          @post.post_tags.create(tag_id: new_tag[:id])
        end
      end
    render json: @post, status: :accepted
    else
      render json: {errors: @post.errors.full_messages, status: :unprocessible_entity}
    end
  end

  def update
    #Remove and rebuild all post tags on update. !!!Discuss better ways to update this.
    if @post.update(post_params[:post_info])
      @post.post_tags.destroy_all
      post_params[:post_tags_attributes].each do |item_hash|
        if item_hash[:tag_id].is_a? Integer 
          @post.post_tags.create(item_hash)
          # Tag.all.each do |t|
          #   if t.post_tags == []
          #     t.destroy
          #   end
          # end
        else
          # new tag handling 
          new_tag = Tag.create(name: item_hash[:tag_id])
          @post.post_tags.create(tag_id: new_tag[:id])
        end
      end
    render json: @post
    else
      render json: {errors: @post.errors.full_messages, status: :unprocessible_entity}
    end
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
    #Formatted to accept nested attributes for post tags
    params.require(:post).permit(post_info: [:id, :title, :content, :img, :user_id],  post_tags_attributes: [:id, :post_id, :tag_id, :name] )
  end
end
