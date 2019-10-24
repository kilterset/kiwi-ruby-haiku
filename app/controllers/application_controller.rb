# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def require_admin_auth
    authenticate_or_request_with_http_basic('Admin') do |username, password|
      @current_admin = Admin.find_by(email: username)&.authenticate(password)
    end
  end
end
