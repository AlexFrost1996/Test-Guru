class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id

  def self.test_titles_in_category(category)
    Test.joins(:category)
        .where(categories: { title: category } )
        .order(title: :desc)
        .pluck(:title)
  end
end
