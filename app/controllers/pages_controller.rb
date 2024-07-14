class PagesController < ApplicationController
  def landing
    @speakers = FeaturedSpeaker.all.order(display_order: :asc)
    @days = current_conference.agenda["schedule"]&.map do |day|
      day.sort_by { |event| event["time"] }
    end
  end

  def login; end

  def me; end
end
