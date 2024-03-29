class PapersController < ApplicationController
  before_action :validate_admin, only: [:index]

  def new
    @paper = Paper.new
    @paper.build_speaker_profile

    @existing_speaker_profile = current_user.speaker_profiles.order(created_at: :desc).first
  end

  def index
    @papers = Paper.includes(:user, :speaker_profile).all.order(created_at: :desc)
  end

  def create
    @paper = Paper.new(paper_params)

    @paper.user = current_user
    @paper.conference = current_conference

    SendBotNotificationJob.perform_later("New paper submitted: #{@paper.title}") unless Rails.env.development?

    if @paper.save
      redirect_to submitted_papers_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def paper_params
    params.require(:paper).permit(
      :title,
      :description,
      :notes,
      :audience_level,
      speaker_profile_attributes: [:name, :url, :affiliation, :bio, :x_handle])
  end
end
