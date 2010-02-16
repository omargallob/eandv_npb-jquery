class ContactController < ApplicationController
layout "lightbox"

  def index
					pickup_variables
		#@contact = Contact.new
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
		if @contact.save
			redirect_to :action => "step2", :id => @contact.id
		else
			flash[:notice] = "Error!!!!!!!!!1"
			pickup_variables
			render :action => "index"
		end
	end
  
	def step2
		#Notifier.deliver_signup_newsletter(@contact)
		mail = Notifier.create_signup_newsletter(params[:id])  # => a tmail object
		Notifier.deliver(mail)
		systemmail = Notifier.create_notify_contact_received(params[:id])  # => a tmail object
		Notifier.deliver(systemmail)
	end

	private
	def pickup_variables
		@interested_in = ["Buying","Selling"]
		@price_range = ["< 500,000","500,000 - 1,500,000", "1,5 - 4,500,000", "4,5 - 12,000,000","> 12,000,000 "]
		@property_types = Property.find(:all, :include => :type).map{|x| [x.type.title,x.type.id] }
		#@countries = Country.find(:all).map.{|y| [y.id,y.title]}
		@countries = Country.find(:all).map{|y| [ y.title, y.id]}
		#@states = Location.find(:all).map{|z| [z.state]}
		@states = Property.find(:all, :include => :location).map{|w| w.location.state}
		@cities = Property.find(:all, :include => :location).map{|w| w.location.region}
	end
end
