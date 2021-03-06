class ContactController < ApplicationController
layout "lightbox"

  def index
		pickup_variables_contact

		@contact = Contact.new
		@page = Page.find_by_name("home")
    render :layout => "application"
  end

	def job
		pickup_variables_job
		@appform = Appform.new
	end

  def neighbourhood
    render :layout => "external"
  end
  
  def mortgage
    @property = Property.find_by_id(params[:id])
    
    @property_tax = @property.price * 0.05
    if @property_tax > 100000
      @property_tax = 100000
    end 
  end 
  
  def plugoo
    render :layout => false
  end
  
  def social
    render :layout => false
  end

	def create
		@contact = Contact.new(params[:contact])
		if verify_recaptcha(:model => @contact, :message => 'Oh! Its error with reCAPTCHA!')
			if @contact.save
				redirect_to :action => "step2", :id => @contact.id
			else

				pickup_variables_contact

			@page = Page.find_by_name("home")
				render :action => "index", :layout => "application"
			end
		end
	end
  
	def apply
		@appform = Appform.new(params[:appform])
		if @appform.save
				
			redirect_to :action => "apply_s2", :id => @appform.id
		else
			flash[:notice] = "Error!!!!!!!!!2"
			render :action => "job"
		end
	end

	def apply_s2
		mail = Notifier.create_signup_appform(params[:id])  # => a tmail object
		Notifier.deliver(mail)
		systemmail = Notifier.create_notify_appform_received(params[:id])  # => a tmail object
		Notifier.deliver(systemmail)
	end

	def step2
		#Notifier.deliver_signup_newsletter(@contact)
		mail = Notifier.create_signup_newsletter(params[:id])  # => a tmail object
		Notifier.deliver(mail)
		systemmail = Notifier.create_notify_contact_received(params[:id])  # => a tmail object
		Notifier.deliver(systemmail)
	end

	def vip
		@contact = Contact.new
	end

	def contact_create
	  @contact = Contact.new(params[:contact])
    
		if @contact.save
			redirect_to :action => "apply_vip", :id => @contact.id
		else
			render :action => "vip"
		end
	end

	def apply_vip
		mail = Notifier.create_signup_vip(params[:id])  # => a tmail object
		Notifier.deliver(mail)
		systemmail = Notifier.create_notify_vip_received(params[:id])  # => a tmail object
		Notifier.deliver(systemmail)
	end

	def lepricaun
		render :layout => false
	end

	def zillow_homevalue
		require 'rillow'		
		@location = Location.find_by_id(params[:id])
		rillow = Rillow.new('X1-ZWz1c216cd0qvf_7aoby')
		@demographics = rillow.get_demographics(:city => @location.region, :state=>'CA')
		@demographics
		#@region_chart = rillow.get_region_chart(:unit_type =>'percent',:city=> @location.city,:state=>'CA', :width=>300, :height=>150, :chart_duration=>'5years')
   respond_to do |format|
      format.xml #
      format.html #
    end
	end
	def zillow_demographics
		require 'rillow'		
		@location = Location.find_by_id(15)
		rillow = Rillow.new('X1-ZWz1c216cd0qvf_7aoby')
		@demographics = rillow.get_demographics(:city => @location.region, :state=>'CA')
		logger.info "Lookin for valur"
		@firstpercentage = @demographics["response"][0]["pages"][0]["page"][0]["tables"][0]["table"][0]["data"][0]["attribute"][6]["values"][0]["city"][0]["value"][0]["content"]
		#@region_chart = rillow.get_region_chart(:unit_type =>'percent',:city=> @location.city,:state=>'CA', :width=>300, :height=>150, :chart_duration=>'5years')
   respond_to do |format|
      format.xml #
      format.html #
    end
	end

	private
	def pickup_variables_contact
		@interested_in = ["Buying","Selling","Renting"]
		@price_range = ["< 500,000","500,000 - 1,500,000", "1,5 - 4,500,000", "4,5 - 12,000,000","> 12,000,000 "]
		@property_types = Type.find(:all).map{|x| [x.title,x.id] }
		#@countries = Country.find(:all).map.{|y| [y.id,y.title]}
		@countries = Country.find(:all).map{|y| [ y.title, y.id]}

		@usa = Country.find_by_id(9)
		@locations = @usa.locations
		@locations.delete_if{|q| q.properties.size == 0}

		@states = @locations.map{|q| q.state }
		@cities = @locations.map{|q| q.region }
	end
	def pickup_variables_job
		@interested_in = Worker.find(:all, :conditions =>{:vacancy=>true}).collect{|x| [x.title, x.id]}
		@price_range = ["< 500,000","500,000 - 1,500,000", "1,5 - 4,500,000", "4,5 - 12,000,000","> 12,000,000 "]
		@property_types = Property.find(:all, :include => :type).map{|x| [x.type.title,x.type.id] }
		#@countries = Country.find(:all).map.{|y| [y.id,y.title]}
		@countries = Country.find(:all).map{|y| [ y.title, y.id]}
		#@states = Location.find(:all).map{|z| [z.state]}
		@states = Property.find(:all, :include => :location).map{|w| w.location.state}
		@cities = Property.find(:all, :include => :location).map{|w| w.location.region}
	end

	
	def buyersguide
	end

end
