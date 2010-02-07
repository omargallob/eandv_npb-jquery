class Admin::OpeningController <Admin::BaseController
  def index
		@openings = Worker.find(:all, :conditions =>{:vacancy=>true})
  end

 

end
