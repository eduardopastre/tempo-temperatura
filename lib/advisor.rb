module Advisor
  class Api
    @endpoint = "http://apiadvisor.climatempo.com.br"
    @token = ENV['ADVISOR_TOKEN']
    @timeout = 15.seconds

    def self.search_city_code city, state
      begin
        response = HTTParty.get(URI.encode("#{@endpoint}/api/v1/locale/city?name=#{city}&state=#{state}&token=#{@token}"), timeout: @timeout)
  
        response[0]["id"] unless response[0].nil?
      rescue => e
        nil
      end
    end

    def self.weather_at_the_moment city_id
      begin
        HTTParty.get("#{@endpoint}/api/v1/weather/locale/#{city_id}/current?token=#{@token}", timeout: @timeout)       
      rescue
        nil
      end
    end


    def self.forecast_15_days city_id
      begin
        HTTParty.get("#{@endpoint}/api/v1/forecast/locale/#{city_id}/days/15?token=#{@token}", timeout: @timeout)
      rescue
        nil
      end
    end
  end

end