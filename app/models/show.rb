class Show < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 100, minimum: 3 }
  validates :person, presence: true
  validates :city, presence: true
end
