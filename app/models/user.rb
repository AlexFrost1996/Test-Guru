class User < ApplicationRecord
  def tests_passed_by_user(level)
    Test.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id')
        .where(user_tests: { user_id: id }, level: level)
  end
end
