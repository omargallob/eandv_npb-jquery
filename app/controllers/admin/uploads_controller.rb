class Admin::UploadsController < Admin::BaseController
layout 'cropper'
	after_filter :wrap_ajax_file_upload_response, :only => [:create]

	def new
		@gallery = Gallery.find(params[:id])
		@upload = Upload.new
	end	

	def create
		@upload = Upload.new(params[:upload])
 
		if @upload.save

		flash.now[:notice] = 'Upload was successfully created.'
		#redirect_to(admin_gallery_path(@gallery))
		else
		flash.now[:notice] = 'Upload was not created.'
		end
		 respond_to do |format|
		    format.js
    end
	end

  def edit
    @upload = Upload.find_by_id(params[:id])
  end
  
  def thumb
    @upload = Upload.find_by_id(params[:id])
  end
	



  def update
    @upload = Upload.find_by_id(params[:p_id])
      if @upload.update_attributes(params[:upload])
        if params[:upload][:photo].blank?
					flash[:notice] = 'Upload was successfully updated.' 
	        redirect_to admin_gallery_path(@upload.gallery)
        else
            render :action => "crop"
         end

      else
	        redirect_to admin_gallery_path(@upload.gallery)
      end
  end

  def destroy
    @upload = Upload.find_by_id(params[:id])
    @upload.destroy

    respond_to do |format|

      format.html { redirect_to(:controller => "galleries",:action=>"show",:id=>@upload.gallery.id) }
      format.xml  { head :ok }
    end
  end

	private

	def wrap_ajax_file_upload_response
		response.content_type = nil
		response.body="<textarea>#{response.body}</textarea>"
	end
end
