class Admin::StaffController < Admin::BaseController
  def index
		@members = Worker.find(:all, :conditions =>{:vacancy=>false})
  end

  def new
		@member = Worker.new
  end

	 def create
    @member = Worker.new(params[:worker])
    
      if @member.save
					if params[:worker][:photo].blank?
							flash[:notice] = 'New staff member added :'+@member.title
							redirect_to(admin_staff_index_path) 
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
       format.html { redirect_to(admin_staff_index_path) }
       format.xml  { head :ok }
     end
  end
end
