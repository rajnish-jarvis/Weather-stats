module ApplicationConcern
  extend ActiveSupport::Concern

  def get_weather_stats(params)
    keyword = params[:q]
    api_url = "https://api.openweathermap.org/data/2.5/forecast?lat=35&lon=139&appid=1635890035cbba097fd5c26c8ea672a1&q=#{keyword}"
    response = HTTParty.get(api_url)
    @results = []

    response['list'].each do |data|
      @results  << {
        date: data['dt_txt'],
        min_temp: data['main']['temp_min'],
        max_temp: data['main']['temp_max'],
        pressure: data['main']['pressure'],
        humidity: data['main']['humidity']
      }
    end
    @results = @results.uniq {|w| w[:date].split(' ')[0]}
  end

  end