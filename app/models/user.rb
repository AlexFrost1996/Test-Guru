class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id

  validates :email, presence: true

  def tests_passed_by_user(level)
    tests.where(level: level)
  end
end
