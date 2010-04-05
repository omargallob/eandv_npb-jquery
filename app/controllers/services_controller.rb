class ServicesController < ApplicationController
  def index
    @page = Page.find_by_name('services')
    @subpages = @page.subpages
    @categories = Category.find_main
    @subcats = Category.find_all_sub
    
  end
  
  def show
    @page = Page.find_by_name('services')
    
    if params[:subcategory] == nil    
      @category = Category.find_by_name(params[:id])
    else
      @category = Category.find_by_name(params[:subcategory])
    end
    @categories = Category.find_main
    @subcats = Category.find_sub(@category.id)
    
      set_meta_tags :title =>  @page.title + " > " + @category.title,
                    :description => @category.description
    respond_to do |format|
      format.html #
    end
  end 
  
  def feed
    if params[:subcategory] == nil    
      @category = Category.find_by_name(params[:id])
    else
      @category = Category.find_by_name(params[:subcategory])
    end
    respond_to do |format|
        format.xml  #{ render :xml => @properties }
    end
  end
end
