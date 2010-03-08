class Admin::CategoryMainController < ApplicationController
layout 'cropper'

 def show
    @category =  Category.find_by_id(params[:id])

  end
  
  def new
    @category =  Category.find_by_id(params[:category_id])
  end

 def create
    @category_main = CategoryMain.new(params[:category_main])
    
    respond_to do |format|
      if @category_main.save
      
        format.html { 
          if params[:category_main][:photo].blank?
            flash[:notice] = 'Property Thumbnail was successfully created.'
            redirect_to(admin_category_main_path(@category_main.category)) 
          else
            render :action => "crop"
          end
        }
        format.xml  { render :xml => @category_main, :status => :created, :location => @category_main }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category_main.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

def update
  @category_main = CategoryMain.find_by_id(params[:id])

       respond_to do |format|
         if  @category_main.update_attributes params[:category_main]

           format.html {
              if params[:category_main][:photo].blank?         
                  flash[:notice] = 'Category was successfully updated.'
                
                    redirect_to(admin_category_main_path( @category_main.category))
                
               else
                 render :action => "crop"
               end
             }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @category_main.errors, :status => :unprocessable_entity }
         end
       end
  end
	def destroy
    @category_main = CategoryMain.find_by_id(params[:id])
    @category_main.destroy

    respond_to do |format|
      flash[:notice] = '<h3>Deleted Category main for :<i>'+@category_main.category.name.upcase+'</i></h3>'
      format.html { redirect_to(admin_category_main_path(@category_main.category)) }
      format.xml  { head :ok }
    end
	end

end
