class IncomingWebhooksController < ApplicationController
  skip_forgery_protection

  def tito
    # todo: verify authenticity of payload
    # key = 'YOUR EVENT SECURITY TOKEN'
    # hash = OpenSSL::Digest.new('sha256')
    # data = 'THE WEBHOOK REQUEST'
    # Base64.encode64(OpenSSL::HMAC.digest(hash, key, data)).strip

    webhook_name = request.headers['X-Webhook-Name']

    webhook = IncomingWebhook.new(
        source: "tito",
        event_name: webhook_name,
        payload: JSON.parse(request.body.read)
    )

    if webhook.save
        case webhook_name
        when 'registration.finished'
            SendBotNotificationJob.perform_later("New Ticket Sale!")
        end
    else
        SendBotNotificationJob.perform_later("Tito said hi but invalid webhook event!")
    end

    head :ok
  end
end
