class HomeController < ApplicationController
  
  def index
    @pagetitle = "Homepage (Front)"
  end
  
	def smarteragent
		@page = Page.find_by_name("home")
	end

	def setup_dropdowns
		#case params[:search_query][:country]
			#when "United States"
			#	@locations = Location.find(:all, :include =>:country, :conditions => ['country_id = ?', 9])
			#when "Argentina"
			#	@locations = Location.find(:all, :include =>:country, :conditions => ['country_id = ?', 11])
			#when "South Africa"
		#end
		@country = Country.find_by_title(params[:search_query][:country])
		@locations = @country.locations
		@locations.delete_if{|s| s.properties.size == 0}

		 		@states = @locations.map { |x| x.state }
				@county = @locations.map { |x| x.county }  
				@region = @locations.map { |x| x.region }
				

    respond_to do |format|
      format.js #
    end
	end
	def setup_dropdowns_form

		@country = Country.find_by_id(params[:contact][:country])
		@locations = @country.locations
		@locations.delete_if{|s| s.properties.size == 0}

		 		@states = @locations.map { |x| x.state }
				@county = @locations.map { |x| x.county }  
				@region = @locations.map { |x| x.region }
				

    respond_to do |format|
      format.js #
    end
	end
	def signin
		render :layout => false 
	end
end
