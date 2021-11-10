class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update
  before_update :before_update_set_success

  TEST_COMPLITED = 85

  def completed?
    current_question.nil?
  end
  
  def accept!(answers_ids)
    if correct_answer?(answers_ids)
      self.correct_questions += 1
    end
    save!
  end

  def succeeded?
    success_percent >= TEST_COMPLITED
  end

  def success_percent
    ((correct_questions.to_f/test.questions.count)*100).round(2)
  end

  def current_question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_update_set_success
    self.success = true if self.succeeded?
  end
  
  def correct_answer?(answers_ids)
    correct_answers.ids.sort == answers_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
