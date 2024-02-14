class PapersController < ApplicationController
  def new
    @paper = Paper.new
    @paper.build_speaker_profile
  end

  def create
    @paper = Paper.new(paper_params)

    @paper.user = current_user
    @paper.conference = current_conference

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
