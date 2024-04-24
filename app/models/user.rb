class User < ApplicationRecord
  has_secure_password
  validates :email_id, presence: true, uniqueness: true

  before_create :update_auth_refresh_token

  def update_auth_refresh_token
    self.auth_token = generate_token
    self.refresh_auth_token = generate_token
    self.valid_till = 1.week.from_now
    self.save!
  end

  def generate_token
    SecureRandom.hex(16)
  end
end
