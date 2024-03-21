require 'telegram/bot'

class SendBotNotificationJob < ApplicationJob
  queue_as :default

  def perform(text)
    token = Rails.application.credentials.telegram_bot_token
    chat_id = Rails.application.credentials.telegram_chat_id

    bot = Telegram::Bot::Client.new(token)

    bot.api.send_message(chat_id:, text:)
  end
end
