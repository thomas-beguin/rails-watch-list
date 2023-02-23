class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :list_id, { scope: :movie_id }
  validates_uniqueness_of :movie_id, { scope: :list_id }
end
