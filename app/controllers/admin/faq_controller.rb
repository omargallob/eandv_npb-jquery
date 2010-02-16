class Admin::FaqController < Admin::BaseController
  def index
	   @faqs = Faq.find(:all)
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
       respond_to do |format|
         if @faq.update_attributes(params[:faq])
          flash[:notice] = 'faq was successfully UPDATED.'
          format.html {
               flash[:notice] = 'faq was successfully updated.'
               redirect_to admin_faq_path 
          }
        else
          render :action => "edit"
        end
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
