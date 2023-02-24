class Review < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true
  validates :rating, presence: true, inclusion: { in: (0..5).to_a }
end
