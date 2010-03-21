class Admin::FaqController < Admin::BaseController
  def index
	   @faqs = Faq.find(:all, :conditions =>['gossip = ?', false])
  end

  def new
  end

	def create
		@faq = Faq.new(params[:faq])
		 if @faq.save
		   flash[:notice] = 'faq was successfully created.'
		   redirect_to admin_faq_path(@faq)
		 else
		   render :action => "new"
		 end

	end

  def edit
	 	@faq = Faq.find_by_id(params[:id])
  end

	def update
	@faq = Faq.find_by_id(params[:id])
   
     if @faq.update_attributes(params[:faq])
      flash[:notice] = 'faq was successfully UPDATED.'
      redirect_to admin_faq_path 
    else
      render :action => "edit"
    end
	end

	def show
		@faq = Faq.find_by_id(params[:id])		
	end	
	def destroy
		@faq = Faq.find_by_id(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html {  redirect_to(admin_faq_path) }
		end
	end
		
end
