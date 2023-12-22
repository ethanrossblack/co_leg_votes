class Bill < ApplicationRecord
  has_many :roll_calls
  has_many :legislator_votes, through: :roll_calls
end
