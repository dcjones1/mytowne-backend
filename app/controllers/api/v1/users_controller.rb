class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: {errors: @user.errors.full_messages, status: :unprocessible_entity}
    end
  end

  def update
    @user.update(user_params)
    render json: @user
  end
  
  def destroy
    user = @user
    @user.destroy
    render json: user
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :birth_date, :email, :username, :town, :avatar, :bio)
  end

end
