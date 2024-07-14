class ConferencesController < ApplicationController
  before_action :validate_admin, only: [:schedule]

  def show
    @conference = current_conference

    render json: @conference
  end

  def schedule
    @conference = current_conference

    if request.get?
      @schedule = @conference.agenda["schedule"]
    elsif request.patch?
      @conference.update({
        agenda: @conference.agenda.merge({schedule: JSON.parse(params[:schedule])})
      })

      redirect_to root_path
    end
  end
end
