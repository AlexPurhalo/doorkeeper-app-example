class Api::UsersController < ApplicationController
  # before_action -> { doorkeeper_authorize! :public }, only: :show
  # before_action -> { doorkeeper_authorize! :write }, only: :update

  def show
    # render json: current_resource_owner.as_json
    response = JSON.parse RestClient.get('http://api.openweathermap.org/data/2.5/forecast?appid=d6ae301398cd22a6c44139eaaf95c03a&q=fastov,ukraine')
    # render response
    render json: response
  end

  def update
    render json: { result: current_resource_owner.touch(:updated_at) }
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end