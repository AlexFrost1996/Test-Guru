class Test < ApplicationRecord
  def self.test_titles_in_category(category)
    Test.joins(:category)
        .where(categories: { title: category } )
        .order(title: :desc)
        .pluck(:title)
  end
end
