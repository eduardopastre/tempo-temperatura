class HomeController < ApplicationController
  include Ipinfo

  def index
    if cookies[:location].nil?
      cookies[:location] = city_by_current_ip || "São Paulo"
    end
  end
end
