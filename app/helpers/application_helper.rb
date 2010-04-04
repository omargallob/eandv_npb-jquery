# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def find_attribute(key,obj=nil)
   if obj==nil then 
     obj=self
   end
   if obj.is_a? Hash then
      obj.each { |k,v|
        if k==key then
          return v
        else
          result = find_attribute(key,v)
          if result != nil then
             return result
          end
        end
     }
   elsif obj.is_a? Array then
      obj.each {|o| 
        result  = find_attribute(key,o)
        if result !=  nil then
          return result       
        end 
      }
   end
   return nil
 end
end
