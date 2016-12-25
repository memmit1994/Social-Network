class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :authenticate_user!

    before_action :configure_devise_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(user)
        user_path(current_user)
    end

    protected

    def configure_devise_permitted_parameters
        registration_params = [:fname, :lname, :nickname, :email, :password, :password_confirmation, :gender, :birthdate, :hometown, :marital_status, :bio]

        if params[:action] == 'update'
            devise_parameter_sanitizer.permit(:account_update, keys: registration_params)
        elsif params[:action] == 'create'
            devise_parameter_sanitizer.permit(:sign_up, keys: registration_params)
        end

    end

end
