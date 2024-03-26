class PagesController < ApplicationController
  def landing
    @subscriber = Subscriber.new

    @speakers = FeaturedSpeaker.all.order(display_order: :asc)
  end

  def login; end

  def me; end
end
