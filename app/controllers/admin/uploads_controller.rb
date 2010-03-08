class Admin::UploadsController < Admin::BaseController
layout 'cropper'
  def edit
    @upload = Upload.find_by_id(params[:id])
  end
  
  def thumb
    @upload = Upload.find_by_id(params[:id])
  end
  
  def update
    @upload = Upload.find_by_id(params[:id])
      if @upload.update_attributes(params[:upload])
        if params[:upload][:photo].blank?
					flash[:notice] = 'Upload was successfully updated.' 
	        redirect_to admin_gallery_path(@upload.gallery)
        else
            render :action => "crop"
         end

      else
        render :action => "edit"
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
end
