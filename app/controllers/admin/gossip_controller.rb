class Admin::GossipController < Admin::BaseController
  def index
	   @gossips = Faq.find(:all, :conditions =>['gossip = ?', true])
  end

  def new
  end

	def create
		@gossip = Faq.new(params[:faq])
		 if @gossip.save
		   flash[:notice] = 'faq was successfully created.'
		   redirect_to admin_gossip_path(@gossip)
		 else
		   render :action => "new"
		 end

	end

  def edit
	 	@gossip = Faq.find_by_id(params[:id])
  end

	def update
	@gossip = Faq.find_by_id(params[:id])
       respond_to do |format|
         if @gossip.update_attributes(params[:faq])
          flash[:notice] = 'Gossip was successfully UPDATED.'
          format.html {
               flash[:notice] = 'Gossip was successfully updated.'
               redirect_to admin_gossip_path 
          }
        else
          render :action => "edit"
        end
      end
	end

	def show
		@gossip = Faq.find_by_id(params[:id])		
	end	
	def destroy
		@gossip = Faq.find_by_id(params[:id])
    @gossip.destroy

    respond_to do |format|
      format.html {  redirect_to(admin_gossip_path ) }
		end
	end
		
end
