class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  private
  def get_user
    @user = User.find(params[:id])
  end
end
