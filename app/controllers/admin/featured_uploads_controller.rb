class Admin::FeaturedUploadsController < Admin::BaseController
after_filter :wrap_ajax_file_upload_response, :only => [:create]
	def new
		upload = FeaturedUpload.new
	end
	def create
		@upload = FeaturedUpload.new(params[:featured_upload])
 
		if @upload.save

		flash.now[:notice] = 'Featured Upload was successfully created.'
		#redirect_to(admin_gallery_path(@gallery))
		else
		flash.now[:notice] = 'Featured Upload was not created.'
		end
		 respond_to do |format|
		    format.js
    end
	end

  def destroy
    @upload = FeaturedUpload.find_by_id(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "featured",:action=>"show",:id=>@upload.featured_gallery.id) }
      format.xml  { head :ok }
    end
  end
	private
	def wrap_ajax_file_upload_response
		response.content_type = nil
		response.body="<textarea>#{response.body}</textarea>"
	end
end
