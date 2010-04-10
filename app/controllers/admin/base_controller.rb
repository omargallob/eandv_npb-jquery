class Admin::BaseController < ApplicationController		

 layout 'admin' 
 
 def setmeta
   set_meta_tags :site => 'Admin - E&V NPB - '+ controller_name.capitalize + ' - ' + action_name
 end
end
