class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :gists
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :creator_id, dependent: :nullify
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :email, presence: true, 
                    uniqueness: true, 
                    format: { with: VALID_EMAIL_REGEX }

  def tests_passed_by_user(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

  def name
    "#{first_name} #{last_name}"
  end
end
