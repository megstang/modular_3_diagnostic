class Search <ActiveRecord::Base

  def initialize(zip)
    @zip = zip[:zipcode]
  end

  def stations
    @stations ||= get_search_results.map do |station_data|
                  station = Station.new(station_data)
                  binding.pry
                  station.save
                end
  end

  def get_search_results
    url ="api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['ALT_FUEL_API_KEY']}&location=#{@zip}&fuel_type=ELEC,LPG&radius=6.0"
    a = JSON.parse(conn.get(url).body)["fuel_stations"]
    return a
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov/") do |f|
      f.adapter  Faraday.default_adapter
      f.params[:api_key] = ENV['ALT_FUEL_API_KEY']
    end
  end

end
