class User < ApplicationRecord
  has_many :weighings

  def archive
    weighings.order(created_at: :desc)
  end

  def last_weighings
    weighings.limit(10).order(created_at: :desc)
  end
end
