class Show < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :title, presence: :true
  acts_as_voteable
end
