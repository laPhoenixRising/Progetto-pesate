class User < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 8..16 }
#la password deve avere almeno 8 caratteri misti

  has_many :weighings

  def archive
    weighings.order(created_at: :desc)
  end

  def last_weighings
    weighings.limit(10).order(created_at: :desc)
  end
end
