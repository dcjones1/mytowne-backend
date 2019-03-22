class Api::V1::PostsController < ApplicationController
  before_action :get_post, only: [:show]

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    render json: @post
  end

  private
  def get_post
    @post = Post.find(params[:id])
  end
end
