class Admin::FeaturedUploadsController < Admin::BaseController
  def destroy
    @upload = FeaturedUpload.find_by_id(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "featured",:action=>"show",:id=>@upload.featured_gallery.id) }
      format.xml  { head :ok }
    end
  end

end
