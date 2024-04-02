class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }
  has_many :weighings

  def archive
    weighings.order(created_at: :desc)
  end

  def last_weighings
    weighings.limit(10).order(created_at: :desc)
  end
end
