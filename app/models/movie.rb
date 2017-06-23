class Movie < ApplicationRecord
  belongs_to :genre

  validates_presence_of :title
end
