class Weighing < ApplicationRecord
  belongs_to :user
  validates :value, comparison: { greater_than: 0 }
  validates :user_id, presence: true
end
