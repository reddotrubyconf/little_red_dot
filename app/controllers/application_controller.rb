class ApplicationController < ActionController::Base
  helper_method :current_conference

  def current_conference
    @current_conference ||= Conference.first
  end

  def validate_admin
    redirect_to root_path unless current_user&.admin?
  end
end
