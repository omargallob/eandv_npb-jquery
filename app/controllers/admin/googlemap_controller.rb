class Admin::GooglemapController < Admin::BaseController
  def index
  end
  
  def show
    @property = Property.find_by_id(params[:id])
    string =  @property.title+", "+@property.location.region+", "+@property.location.county+", "+@property.location.state
    results = Geocoding::get(string)
    if results.status == Geocoding::GEO_SUCCESS
      @coord = results[0].latlon
    end
  end
  
  def create
  end
  
  def update
  end
  
end
