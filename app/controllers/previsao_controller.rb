class PrevisaoController < ApplicationController
  before_action :set_city_and_state, only: [:cidade]

  def cidade
    #city_id = Advisor::Api.search_city_code @city, @state
    city_id = 1

    if !city_id.nil?
      #@forecast = Advisor::Api.forecast_15_days city_id
      cookies[:location] = @city unless @forecast.nil?
    end
    
    # respond_to do |format|
    #   flash[:notice] = "Desculpe, mas não foi possível obter daods para esta cidade no momento"
    #   format.html { redirect_to root_path }
    # end if @forecast.nil?
  end

  private

    def set_city_and_state
      @city = params[:city]
      @state = params[:state]
    end
end
