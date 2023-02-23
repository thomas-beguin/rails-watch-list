class Movie < ApplicationRecord
  has_many :bookmarks#, dependent: :restrict_with_errors
  has_many :lists, through: :bookmarks

  validates :title, uniqueness: true, presence: true
  validates :overview, uniqueness: true, presence: true

end
