class IncomingWebhooksController < ApplicationController
  skip_forgery_protection

  def tito
    # todo: verify authenticity of payload
    # key = 'YOUR EVENT SECURITY TOKEN'
    # hash = OpenSSL::Digest.new('sha256')
    # data = 'THE WEBHOOK REQUEST'
    # Base64.encode64(OpenSSL::HMAC.digest(hash, key, data)).strip

    webhook_name = request.headers['X-Webhook-Name']
    payload = JSON.parse(request.body.read)

    webhook = IncomingWebhook.new(
        source: "tito",
        event_name: webhook_name,
        payload:
    )

    if webhook.save
        case webhook_name
        when 'registration.finished'
          payload["line_items"].each do |line_item|
            SendBotNotificationJob.perform_later(
              "#{line_item["quantity"]} x $#{line_item["price"]} | #{line_item["title"]}"
            )
          end
        end
    else
        SendBotNotificationJob.perform_later("Tito said hi but invalid webhook event!")
    end

    head :ok
  end
end
