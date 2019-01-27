class Book2 < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: { scope: :author_id }

  # After Uniqueness
  validates :pages,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 1
    }

end
