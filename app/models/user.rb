class User < ApplicationRecord
  def tests_passed_by_user(level)
    Test.where(level: level)
  end
end
