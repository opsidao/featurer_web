module FeaturerWeb
  class SessionsController < ApplicationController
    skip_before_action :authenticate

    def login
      FeaturerWeb.admin_users.each do |user_hash|
        next unless credentials_match?(user_hash)

        session[:current_user] = username
        flash[:info] = 'Welcome home!'

        redirect_to root_path

        break
      end

      return if session[:current_user]

      flash[:error] = 'Invalid credentials'

      render :show_login
    end

    def logout
      session[:current_user] = nil

      redirect_to root_path
    end

    private

    def credentials_match?(user_hash)
      user_hash[:username] == username && user_hash[:password_sha256] == password_sha256
    end

    def username
      params[:username].to_s
    end

    def password_sha256
      @password_sha256 ||= Digest::SHA256.digest(params[:password].to_s)
    end
  end
end
