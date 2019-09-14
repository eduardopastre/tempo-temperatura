class PrevisaoController < ApplicationController
  before_action :set_city_and_state, only: [:cidade]

  def cidade
    city_id = Advisor::Api.search_city_code @city, @state
    #city_id = 1

    if !city_id.nil?
      @forecast = Advisor::Api.forecast_15_days city_id
      @weather = Advisor::Api.weather_at_the_moment city_id
      #@weather = {"id": 4134,"name":"Fern\u00e3o","state":"SP","country":"BR  ", "data": {"temperature": 10, "wind_direction":"ESE","wind_velocity":21.9,"humidity":74,"condition":"Muitas nuvens","pressure":959.6,"icon":"2rn","sensation":8,"date":"2019-08-03 23:34:49"}}.as_json
      cookies[:location] = @city unless @weather.nil?
    end

    puts @weather
    
    respond_to do |format|
      flash[:notice] = "Desculpe, mas não foi possível obter daods para esta cidade no momento"
      format.html { redirect_to root_path }
    end if @weather.nil?
  end

  private

    def set_city_and_state
      @city = params[:city]
      @state = params[:state]
    end
end
