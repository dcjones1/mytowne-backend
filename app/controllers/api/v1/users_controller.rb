class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :get_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  # def login
  #   @user = User.find_by(username: params[:username])
  #   if @user && @user.authenticate(params[:password])
  #     render json: @user
  #   else
  #     render json: {errors: "Username or password is incorrect", status: :unprocessible_entity}
  #   end
  # end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: @user.errors.full_messages, status: :not_acceptable }
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
    params.require(:user).permit(:id, :name, :birth_date, :email, :username, :town, :avatar, :bio, :password, :password_confirmation)
  end

end
