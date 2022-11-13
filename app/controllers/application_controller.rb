class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    return account_root_path if resource.is_a?(User)
    return manager_root_path if resource.is_a?(Admin)
  end

  def after_sign_out_path_for(resource)
    return new_user_session_path if resource == :user
    return new_admin_session_path if resource == :admin
  end


  protected

  def configure_permitted_parameters
    
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.tap do |params|
        params[:gender] = params[:gender].to_i
      end

      user.permit(:password, :password_confirmation, 
                  :email, :name, 
                  :last_name, :cpf, :agree, :gender) 
      end
  end
end
