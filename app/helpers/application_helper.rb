module ApplicationHelper

  def active 
     @active = { :first => "#", :second => "#" }
     if params[:controller] == "homes" && params[:action] = "index"
       @active[:first] = "active" 
     else
       @active[:second] = "active" 
     end
     return @active
  end

end
