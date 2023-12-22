class Legislator < ApplicationRecord
  has_many :legislator_votes
  has_many :roll_calls, through: :legislator_votes
end
