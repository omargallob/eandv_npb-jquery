class Admin::UsersController < Admin::BaseController
  def index
    @users = User.find(:all,:order=>"login")
  end

  def new
      @user = User.new
  end

  def create
   params[:user][:role_ids] ||= [] 
    #logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      #self.current_user = @user # !! now logged in
      redirect_back_or_default(admin_users_path)
      #flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry."
      render :action => 'new'
    end
  end

  def edit
      @user = User.find(params[:id])
  end
  
  def update
     params[:user][:role_ids] ||= [] 
     @user = User.find(params[:id])
      respond_to do |format|
        if @user.update_attributes(params[:user])
          flash[:notice] = 'user was successfully updated.'
          format.html { redirect_to(admin_users_path) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
   end
  
  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      flash[:notice] = 'Deleted user with id:'+@user.id.to_s
      format.html { redirect_to(admin_users_path) }
      format.xml  { head :ok }
    end
  end

	def import_csv

		@importedcsv = CsvImport.find(:all)
		@aux_imports = []
	  import_from_csv
    @users = User.find(:all,:order=>"login")	
		render :action => "index"
	end 
	
	def create_static_emails
		CsvImport.create(:name =>"Omar Gallo", :email =>"omargallob@gmail.com")
		CsvImport.create(:name =>"Ryan Stokes", :email =>"ryanstokesweet@gmail.com")
	end
	
	def import_from_csv
	require 'csv'
			CSV.open('csvs/CSV13.csv', 'r').each do |row|
				unless row[1] == nil
					csv = CsvImport.new(:name => row[0], :email => row[1])
					if csv.save
						@aux_imports << csv	
					end
				end	
			end
			
	  flash[:notice] = 'Added '+@aux_imports.length.to_s+' unique'		
	end
	
	def mailing_list
		@import1 = CsvImport.find_by_id(1)
		@import2 = CsvImport.find_by_id(2)

			mail = Notifier.create_first_lot(@import1.id)  # => a tmail object
			Notifier.deliver(mail)

			mail2 = Notifier.create_first_lot(@import2.id)  # => a tmail object
			Notifier.deliver(mail2)

		@users = User.find(:all,:order=>"login")	
		#flash[:notice] = 'Sent to  '+@imports.length.to_s+' unique cotnacts'		
		render :action => "index"
	end

	def csvs_vip_newsletter
		@import1 = CsvImport.find_by_id(1)
		@import2 = CsvImport.find_by_id(2)

			mail = Notifier.create_vip_newsletter(@import1.id)  # => a tmail object
			Notifier.deliver(mail)

			mail2 = Notifier.create_vip_newsletter(@import2.id)  # => a tmail object
			Notifier.deliver(mail2)


		@users = User.find(:all,:order=>"login")	
		flash[:notice] = 'VIP sent Sent to 2 unique cotnacts'		
		render :action => "index"
	end

	def list_csvs
		@imports = CsvImport.find(:all,:order=>"name")
	end
end
