module Ipinfo

  def city_by_current_ip
    begin
      ipinfo = HTTParty.get("https://ipinfo.io/json")
      !ipinfo.nil? ? ipinfo["city"] : nil
    rescue
      nil
    end
  end
end