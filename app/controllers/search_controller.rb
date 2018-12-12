class SearchController <ApplicationController
  def index
    binding.pry
    search = Search.new(zipcode: params[:q])
    @stations = search.stations
  end
end
