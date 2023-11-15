class WebhookNotifierJob < ApplicationJob
  queue_as :default

  def perform(data, endpoint)
    signature = generate_signature(data)
    begin
      HTTParty.post(endpoint, body: data.to_json, headers: { 'Content-Type' => 'application/json','X-Signature' => signature })
    rescue StandardError => e
      Rails.logger.error("Webhook notification failed: #{e} - #{data}")
    end
  end



  private

  def generate_signature(data)
    payload = JSON.dump(data)
    key = Rails.application.credentials.webhook_secret_key
    OpenSSL::HMAC.hexdigest('SHA256', key, payload)
  end

end
