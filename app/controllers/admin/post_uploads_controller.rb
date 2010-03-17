class Admin::PostUploadsController < ApplicationController
after_filter :wrap_ajax_file_upload_response, :only => [:create]
	def new
		upload = PostUpload.new
	end
	def create
		@upload = PostUpload.new(params[:post_upload])
 
		if @upload.save

		flash.now[:notice] = 'Post Upload was successfully created.'
		#redirect_to(admin_gallery_path(@gallery))
		else
		flash.now[:notice] = 'Post Upload was not created.'
		end
		 respond_to do |format|
		    format.js
    end
	end

  def destroy
    @upload = PostUpload.find_by_id(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "post_gallery",:action=>"show",:id=>@upload.post_gallery.id) }
      format.xml  { head :ok }
    end
  end
	private
	def wrap_ajax_file_upload_response
		response.content_type = nil
		response.body="<textarea>#{response.body}</textarea>"
	end
end
