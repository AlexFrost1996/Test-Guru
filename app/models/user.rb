class User < ApplicationRecord
  def tests_passed_by_user(level)
    Test.joins('INNER JOIN tests_users ON tests.id = tests_users.test_id')
        .where(tests_users: { user_id: id }, level: level)
  end
end
