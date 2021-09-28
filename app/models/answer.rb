class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answer_limit, on: :create

  private

  def self.validate_answer_limit
    errors.add(:answer, "can't include more than 4 answers.") if question.answers.count >= 4
  end
end
