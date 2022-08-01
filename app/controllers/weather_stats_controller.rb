class WeatherStatsController < ApplicationController
  include ApplicationConcern
  # Get Weather stats of next five days with a city
  def index
    begin
    get_weather_stats(params)
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end
end
