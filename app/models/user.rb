class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id

  def tests_passed_by_user(level)
    Test.joins('INNER JOIN tests_users ON tests.id = tests_users.test_id')
        .where(tests_users: { user_id: id }, level: level)
  end
end
