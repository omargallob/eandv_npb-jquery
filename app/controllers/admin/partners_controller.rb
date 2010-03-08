class Admin::PartnersController < Admin::BaseController
  def index
    @category = Category.find_by_id(params[:category_id])
    @partners = Partner.find(:all, :conditions=>{:category_id =>params[:category_id]})
  end

  def show
  end

  def new
   @category = Category.find_by_id(params[:category_id])
  end

  def create
      @partner = Partner.new(params[:partner])

      respond_to do |format|
        if @partner.save

          format.html { 
          if params[:partner][:photo].blank?
         			flash[:notice] = 'partner was successfully created.'
              redirect_to( admin_category_partners_path(@partner.category_id)) 
          else
            render :action => "crop"
          end
              
           
          }
          format.xml  { render :xml => @partner, :status => :created, :location => @cat }
        else
          format.html { render :action => "new", :category_id => params[:partner][:category_id] }
          format.xml  { render :xml => @partner.errors, :status => :unprocessable_entity }
        end
      end
  end
  
  def edit
    @partner = Partner.find_by_id(params[:id])
    @category = Category.find_by_id(@partner.category.id)
  end
  
  def update
       @partner = Partner.find_by_id(params[:id])
       respond_to do |format|
         if @partner.update_attributes(params[:partner])
           format.html { 
            
                  if params[:partner][:photo].blank?
         			flash[:notice] = 'partner was successfully created.'
              redirect_to( admin_category_partners_path(@partner.category_id)) 
          else
            render :action => "crop"
          end
           
            
            }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @partner.errors, :status => :unprocessable_entity }
         end
       end
  end 

  def destroy
    @partner = Partner.find(params[:id])
     @partner.destroy

     respond_to do |format|
       format.html { redirect_to(admin_category_partners_path(@partner.category_id)) }
       format.xml  { head :ok }
     end
  end
end
