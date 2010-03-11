class Admin::StaffController < Admin::BaseController
  def index
		@members = Worker.find(:all, :conditions =>{:vacancy=>false}, :order => :position)
  end

  def new
		@member = Worker.new
  end

	 def create
    @member = Worker.new(params[:worker])
    
      if @member.save
					if params[:worker][:photo].blank?
							flash[:notice] = 'New staff member added :'+@member.title
							if @member.vacancy 
								redirect_to(admin_opening_index_path) 
							else
								redirect_to(admin_staff_index_path) 
							end	
						else
							render :action => "crop"
						end
      else
       render :action => "new" 
      end
    
  end
  
  def edit
		@member = Worker.find_by_id(params[:id])
  end

	def update
	      @member = Worker.find_by_id(params[:id])
       respond_to do |format|
         if @member.update_attributes(params[:worker])
           format.html { 
						if params[:worker][:photo].blank?
							flash[:notice] = 'New staff member added :'+@member.title
							redirect_to(admin_staff_index_path) 
						else
							render :action => "crop"
						end
            
            }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @member.errors, :status => :unprocessable_entity }
         end
       end
	end

  def show
		@member = Worker.find_by_id(params[:id])
  end

	def destroy
	  
     @member = Worker.find_by_id(params[:id])
     @member.destroy

     respond_to do |format|
       format.html { 
				if @member.vacancy 
								redirect_to(admin_opening_index_path) 
							else
								redirect_to(admin_staff_index_path) 
							end	
			 }
       format.xml  { head :ok }
     end
  end

	def prioritize_staff

			members = Worker.find(:all, :conditions =>{:vacancy=>false})
    members.each do |member|
      member.position = params['staff'].index(member.id.to_s) + 1
      member.save
    end
    render :nothing => true
	end
end
