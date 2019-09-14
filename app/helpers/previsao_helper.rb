module PrevisaoHelper

  def self.weather_temperature response_api
    return "n/a" unless weather_present? response_api     
    response_api['data']['temperature']
  end

  def self.weather_icon_name response_api
    return "n/a" unless weather_present? response_api     
    response_api['data']['icon']
  end

  def self.weather_condition response_api
    return "n/a" unless weather_present? response_api     
    response_api['data']['condition']
  end

  def self.weather_humidity response_api
    return "n/a" unless weather_present? response_api     
    response_api['data']['humidity']
  end

  def self.weather_sensation response_api
    return "n/a" unless weather_present? response_api     
    response_api['data']['sensation']
  end

  def self.weather_present? response_api
    response_api['data'].present?
  end

  def self.weather_data response_api
    {
      temperature: self.weather_temperature(response_api),
      icon: self.weather_icon_name(response_api),
      condition: self.weather_condition(response_api),
      humidity: self.weather_humidity(response_api),
      sensation: self.weather_sensation(response_api)
    }
  end

  def temperature forecast
    return "n/a" unless temperature_present? forecast    

  end

  def temperature_present? forecast
    forecast["data"].nil? || forecast["data"][0]["temperature"].nil?
  end
end
