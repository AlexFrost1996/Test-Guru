class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @current_test = test_passage.test
    @current_user = test_passage.user
    @badges = Badge.all
  end

  def call
    @count_user_badges = @current_user.badges.count
    @badges.each do |badge|
      if not_received_earlier?(badge) && send("#{badge.rule}_rule_completed?", badge)
        @current_user.badges << badge
      end
    end
    
    if @count_user_badges != @current_user.badges.count
      flash[:notice] = "You have new achievements! Check out your rewards!"
    end
  end

  private

  def not_received_earlier?(badge)
    @current_user.badges.exclude?(badge)
  end

  def first_rule_completed?(badge)
    @current_test.test_passages.where(user: @current_user, success: true).count == 1
  end

  def level_rule_completed(badge)
    all_tests_by_level = Test.tests_in_level(badge.rule_value).count
    success_tests_by_level = tests_passed_success.tests_in_level(badge.rule_value).uniq.count
    all_tests_by_level == success_tests_by_level
  end

  def category_rule_completed?(badge)
    all_tests_by_category = Test.tests_in_category(badge.rule_value).count
    success_tests_by_category = tests_passed_success.tests_in_category(badge.rule_value).uniq.count
    all_tests_by_category == success_tests_by_category
  end

  def tests_passed_success
    @current_user.tests.where("test_passages.success = true")
  end
end
