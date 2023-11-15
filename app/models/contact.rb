class Contact < ApplicationRecord

  validates :first_name, :last_name, :address, presence: true
  validates_uniqueness_of :first_name, :scope => :last_name
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z/ }

end