class Book < ApplicationRecord
  # Before Uniqueness
  validates :pages,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 1
    }

  validates :title,
    presence: true,
    uniqueness: { scope: :author_id }

end
