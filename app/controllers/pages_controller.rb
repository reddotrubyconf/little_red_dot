class PagesController < ApplicationController
  def landing
    @subscriber = Subscriber.new
  end

  def me; end
end
