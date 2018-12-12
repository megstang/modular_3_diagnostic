class SearchController <ApplicationController
  def index
    @stations = Search.new(zipcode: params[:q]).stations
  end
end
