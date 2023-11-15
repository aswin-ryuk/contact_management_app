class Contact < ApplicationRecord

	after_commit :notify_third_party_endpoints, on: [:create, :update]

  validates :first_name, :last_name, :address, presence: true
  validates_uniqueness_of :first_name, :scope => :last_name
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/ }

  def notify_third_party_endpoints
    Rails.application.secrets[:api_endpoints].each do |endpoint|
      WebhookNotifierJob.perform_later(self.attributes, endpoint)
    end
  end

end