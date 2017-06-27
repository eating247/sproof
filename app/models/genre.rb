class Genre < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :movies, through: :categorizations

  validates :title, presence: true,
                    length: { in: 1..60 }
end
