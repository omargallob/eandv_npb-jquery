class Admin::OverviewController < Admin::BaseController
 
  def index
    @pages = Page.find(:all)
    @categories = Category.find(:all)
		@countries = Country.find(:all)
    @facilities = Facility.find(:all)
    @properties = Property.find(:all)
    @metatags = Metatag.find(:all)
  end
end
