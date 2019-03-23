class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag, status: :accepted
    else
      render json: {errors: @tag.errors.full_messages, status: :unprocessible_entity}
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:id, :name)
  end
end
