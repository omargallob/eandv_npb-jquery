class ViewerController < ApplicationController
  def show
    @page = Page.find_by_name(params[:name])
    @parent = Page.find_by_name(params[:parent])
    if params[:parent]
      @subpages = @parent.subpages
    else
      @parent = @page
       @subpages = @page.subpages
    end
   
    if @page.metatag
      set_meta_tags :title =>  @page.title,
                  :description => @page.metatag.description,
                  :keywords =>  @page.metatag.keywords 
    else
      set_meta_tags :title =>  @page.title
    end  
    
    #@properties = Property.find(:all)
  end

end
