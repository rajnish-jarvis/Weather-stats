class WeatherStatsController < ApplicationController
  include ApplicationConcern
  # Get Weather stats of next five days with a city
  def index
    get_weather_stats(params)
  end
end
