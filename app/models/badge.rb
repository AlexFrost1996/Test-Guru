class Badge < ApplicationRecord
  has_many :user_badges, dependent: :nullify
  has_many :users, through: :user_badges

  validates :title, presence: true, uniqueness: true
  validates :image_name, presence: true
  validates :rule, presence: true
  validates :rule_value, presence: true

  RULES = %i[level first category]
end
