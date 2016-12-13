  class WeathersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    # looks for weathers list of chosen user
    @weathers = Weather.where(user_id: params[:user_id])

    # renders serialized info about the weather list
    render json: @weathers
  end

  def show
    # looks for weather from weathers list for current user
    @weather = Weather.where(user_id: params[:user_id], id: params[:id])

    # render serialized info about this weather
    render json: @weather
  end

  def create
    # url that fetches data from openweathermap API
    request_url = 'http://api.openweathermap.org/data/2.5/forecast?appid=d6ae301398cd22a6c44139eaaf95c03a&q=fastov,ukraine'

    # parses data that contains the all info about city and weather in this city
    response = JSON.parse RestClient.get(request_url)

    # city's info
    city_lon = response['city']['coord']['lon'].to_json
    city_lat = response['city']['coord']['lat'].to_json
    city_name = response['city']['name'].to_json

    # weather's info
    weather_temps = response['list'][0]['main']['temp'].to_json
    weather_pressure = response['list'][0]['main']['pressure'].to_json
    weather_humidity = response['list'][0]['main']['humidity'].to_json

    # user id
    user_id = params[:user_id]

    # creates record with appropriate data about weather in the chosen city
    errors = Array.new

    # pushes error if city is already in list
    city_in_list = Weather.where(user_id: user_id, name: city_name).first
    errors.push('This city already in list') if city_in_list

     @weather = Weather.new(
        name: city_name,
        temps: weather_temps,
        pressure: weather_pressure,
        humidities: weather_humidity,
        lon: city_lon,
        lat: city_lat,
        user_id: user_id
    )

    # saves record to db if errors weren't founded
    errors.empty? && @weather.save

    # renders the data about created record
    render json: errors.empty? ? @weather : { errors: errors}
  end
end