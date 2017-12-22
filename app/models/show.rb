class Show < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  validates :title, presence: :true
=======
  has_many :reviews
  validates :title, presence: :true
  acts_as_voteable
>>>>>>> add-reviews
end
