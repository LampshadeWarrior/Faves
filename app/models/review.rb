class Review < ApplicationRecord
  belongs_to :show
  acts_as_voteable
end
