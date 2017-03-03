module FeaturerWeb
  class ApplicationController < ActionController::Base
    attr_reader :current_user
    helper_method :current_user

    before_action :authenticate

    private

    def authenticate
      return if (@current_user = session[:current_user])

      redirect_to login_path
    end
  end
end
