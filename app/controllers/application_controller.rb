class ApplicationController < ActionController::Base
  helper_method :current_conference

  def current_conference
    @current_conference ||= Conference.first
  end
end
