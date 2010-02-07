class Admin::StaffController < Admin::BaseController
  def index
		@members = Worker.find(:all, :conditions =>{:vacancy=>false})
  end

  def new
		@member = Worker.new
  end

	 def create
    @member = Worker.new(params[:worker])
    respond_to do |format|
      if @member.save
        flash[:notice] = 'New staff member added :'+@member.title
        format.html { redirect_to(admin_staff_index_path) }
      else
        format.html { render :action => "new" }
      end
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
            
               flash[:notice] = 'worker was successfully updated.'
               redirect_to( admin_staff_path(@member)) 
            
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
