class WeathersController < ApplicationController
  def index
    @weathers = Weather.where(user_id: params[:id])
    render json: @weathers
  end

  def show
    # @weather = Weather.where(user_id: params[:id]).first

    render json: params
  end

  def create

  end
end