class Station<ActiveRecord::Base
  attr_reader :name, :address, :fuel_type, :distance, :access_time

  def initialize(data)
    @name = data["station_name"]
    @address = data["street_address"]
    @fuel_type = data["fuel_type_code"]
    @distance = data["distance"]
    @access_time = data["access_days_time"]
    binding.pry
  end
end
