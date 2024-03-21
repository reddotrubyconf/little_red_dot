class PagesController < ApplicationController
  def landing
    @subscriber = Subscriber.new
  end

  def login; end

  def me; end
end
