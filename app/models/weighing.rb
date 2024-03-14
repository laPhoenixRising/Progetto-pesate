class Weighing < ApplicationRecord
  belongs_to :user
  validates :value, presence: true, comparison: { greater_than: 0 }
  validates :user_id, presence: true
end
