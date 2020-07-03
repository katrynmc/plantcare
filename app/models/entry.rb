class Entry < ApplicationRecord
  has_many :artifacts
  validates :title, presence: true, length: { minimum: 5 }
end
