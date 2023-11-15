class WebhooksController < ApplicationController
  protect_from_forgery with: :null_session

  def receive
    verify_webhook_signature
    Rails.logger.info('Webhook verified successful')
    head :ok
  end

  private

  def verify_webhook_signature
    payload = request.body.read
    signature = request.headers['X-Signature']

    unless valid_signature?(payload, signature)
      head :unauthorized
    end
  end

  def valid_signature?(payload, signature)
    key = Rails.application.credentials.webhook_secret_key
    expected_signature = OpenSSL::HMAC.hexdigest('SHA256', key, payload)
    Rack::Utils.secure_compare(signature, expected_signature)
  end
end
