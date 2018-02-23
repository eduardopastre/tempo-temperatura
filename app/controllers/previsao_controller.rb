class PrevisaoController < ApplicationController
  #include ApiAdvisor
  def cidade
    city_id = Advisor::Api.search_city_code params[:city], params[:state]

    if !city_id.nil?
      @forecast = Advisor::Api.forecast_15_days city_id
      cookies[:location] = params[:city] unless @forecast.nil?
    end
    
    respond_to do |format|
      flash[:notice] = "Desculpe, mas não foi possível obter daods para esta cidade no momento"
      format.html { redirect_to root_path }
    end if @forecast.nil?
  end
end
