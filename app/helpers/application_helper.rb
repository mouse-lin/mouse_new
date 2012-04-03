module ApplicationHelper

  def active 
     @active = { :first => "#", :second => "#", :third => "#" }
     if params[:controller] == "homes" && params[:action] == "mouse"
       @active[:first] = "active" 
     elsif params[:controller] == "homes" && params[:action] == "index"
       @active[:second] = "active"
     else
       @active[:third] = "active" 
     end
     return @active
  end

end
