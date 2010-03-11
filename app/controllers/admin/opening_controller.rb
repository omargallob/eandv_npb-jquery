class Admin::OpeningController <Admin::BaseController
  def index
		@openings = Worker.find(:all, :conditions =>{:vacancy=>true}, :order => :position)
  end

 
	def prioritize_opening

			members = Worker.find(:all, :conditions =>{:vacancy=>true})
  	members.each do |member|
     	member.position = params['staff'].index(member.id.to_s) + 1
      member.save
    end
    render :nothing => true
	end

end
