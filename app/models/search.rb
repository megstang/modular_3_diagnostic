class Search <ActiveRecord::Base

  def initialize(zip)
    @zip = zip
  end

  def stations
    @stations ||= get_search_results.map do |station_data|
                  Station.new(station_data)
                end
  end

  def get_search_results
    url = "/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['ALT_FUEL_API_KEY']}&zip=#{@zip}"
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov") do |f|
      f.adapter  Faraday.default_adapter
      f.params[:api_key] = ENV['ALT_FUEL_API_KEY']
    end
  end

end
