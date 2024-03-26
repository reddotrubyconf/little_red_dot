class FeaturedSpeakersController < ApplicationController
    before_action :validate_admin

    def new
        @speaker = FeaturedSpeaker.new
    end

    def create
        @speaker = FeaturedSpeaker.new(speaker_params)

        if @speaker.save
            redirect_to featured_speakers_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def index
        @speakers = FeaturedSpeaker.all.order(display_order: :asc)
    end

    def destroy
        @speaker = FeaturedSpeaker.find(params[:id])
        @speaker.destroy

        redirect_to featured_speakers_path
    end

    def bump_up
        @speaker = FeaturedSpeaker.find(params[:id])
        @speaker.bump_up!

        redirect_to featured_speakers_path
    end

    def bump_down
        @speaker = FeaturedSpeaker.find(params[:id])
        @speaker.bump_down!

        redirect_to featured_speakers_path
    end

    private

    def speaker_params
        params.require(:featured_speaker).permit(
            :display_picture,
            :name,
            :title,
            :github_handle
        )
    end
end
