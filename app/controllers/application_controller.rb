class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :check_authorization

    def respond_modal_with(*args, &blk)
      options = args.extract_options!
      options[:responder] = ModalResponder
      respond_with *args, options, &blk
    end

    def check_authorization
      if current_user.nil? && !devise_controller?
        redirect_to new_user_session_path
      end
    end
end
