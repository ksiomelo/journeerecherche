class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_app_settings
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || (resource.admin?) ? root_path : inscriptions_path
  end
  
  
  def require_admin
    unless current_user and current_user.admin?
      flash[:alert] = "You must be admin to access this section" 
      redirect_to new_user_session_url # Prevents the current action from running
    end
  end 
  
  
  def require_admin_if_waiting
    @inscription = Inscription.find(params[:id])
    if not @inscription.approved and not current_user.admin? 
      flash[:alert] = "You must be admin to access this section" 
      redirect_to new_user_session_url # Prevents the current action from running
    end
  end 
  
  def check_register_student
    if not @app_settings.student_register 
      flash[:alert] = "La periode d'inscription est fini" 
      redirect_to root_url # Prevents the current action from running
    end
  end 
  
  def check_register_enterprise
    if not @app_settings.enterprise_register 
      flash[:alert] = "La periode d'inscription est fini" 
      redirect_to root_url # Prevents the current action from running
    end
  end 
  
  def get_app_settings
    @app_settings = AppSettings.find(1)
  end
  
  
  
end
