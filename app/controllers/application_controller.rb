class ApplicationController < ActionController::Base
  protect_from_forgery
  #rescue_from ActiveRecord::RecordInvalid,:with => :respond_for_exception


  def respond_for_exception exception
    render_error exception.message
  end

  def render_error error_msg = "", content_type = "text/html"
    logger.info "+++++++++++++++ render_wando_error: #{error_msg.inspect} +++++++++++++++"
    respond_to do |format|
      format.html do
        flash[:info] = error_msg
      end
     # format.js { render :js => "throw '#{error_msg}';" , :status => :bad_request }
     # format.html { render :text => error_msg, :status => :bad_request }
     # format.json { 
     #   is_active_record = error_msg.is_a? ActiveRecord::Base
     #   render({ 
     #     :json => { 
     #       :success => false,
     #       :root => {
     #         :active_record_error => is_active_record,
     #         :error_msg => is_active_record ? error_msg.errors.full_messages.uniq : error_msg
     #       }
     #     },
     #     :content_type => content_type,
     #     :status => :bad_request
     #   })
     # }
    end
  end
end
