# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
	protect_from_forgery :except => :rpxnow

  # render new.rhtml
  def new
    set_meta_tags :title => 'Login',
                  :description => 'Member login page.',
                  :keywords => 'Engel&Volkers, Site, Login, Admin'
    @subpages = [""]
  end

  def create
    @pagetitle="Logged in to Admin"
    logout_keeping_session!
    user = User.authenticate(params[:login], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      if user.has_role?("admin")
        redirect_back_or_default('/admin')
      else 
        if user.has_role?("eandv")
          redirect_back_or_default('/admin')          
        else
          redirect_back_or_default('/')
        end
      end
      flash[:notice] = "Logged in successfully"
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
	
def rpxnow
  u = URI.parse('https://rpxnow.com/api/v2/auth_info')
  req = Net::HTTP::Post.new(u.path)
  req.set_form_data({'token' => params[:token],
                      'apiKey' => "2a3f95827b27fd40ec83ee64df09d6caaef2c0af",  # <-- your RPX api key here.
                      'format' => 'json'})

  http = Net::HTTP.new(u.host,u.port)
  http.use_ssl = true if u.scheme == 'https'
  res = http.request(req)

  json_resp = res.body
  json = JSON.parse(json_resp)

  if json['stat'] == 'ok'
    unique_identifier = json['profile']['identifier']
    nickname = json['profile']['preferredUsername']
    nickname = json['profile']['displayName'] if nickname.nil?
    email = json['profile']['email']
    photo_url = json['profile']['photo']
		name = json['profile']['name']
		provider = json['profile']['provider']
 
    # implement your own do_success method which signs the user in
    # to your website
   do_success(unique_identifier,email,nickname,photo_url,name,provider)

  else
    flash[:notice] = 'Log in failed'
    redirect_to '/'
  end
end

def do_success(unique_identifier,email,nickname,photo_url,name,provider)
	logger.info "UI #{unique_identifier}\n+Email: #{email}\n+Nickname:#{nickname}\n+Photo#{photo_url}" 
	user = User.find_by_unique_identifier(unique_identifier)
	unless user
		user = User.new
		user.name = nickname
		user.email = email
		user.unique_identifier = unique_identifier
		user.login = nickname
		user.password = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{nickname}")
		user.password_confirmation = 	user.password
		user.save!
	end
	flash[:notice] = 'Logged in !!'
	self.current_user = user
  redirect_to '/'
 #user = User.authenticate("superuser","123456")
 #self.current_user = user
 #redirect_back_or_default('/admin')
end


protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
end
