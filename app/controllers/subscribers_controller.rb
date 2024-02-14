class SubscribersController < ApplicationController
  def create
    subscriber = Subscriber.new(subscriber_params)
    subscriber.conference = current_conference

    subscriber.save

    render partial: 'subscribers/form', locals: { subscriber: }
  end


  private
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
