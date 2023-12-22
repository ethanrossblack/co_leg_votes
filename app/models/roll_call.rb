class RollCall < ApplicationRecord
  belongs_to :bill
  has_many :legislator_votes
  has_many :legislators, through: :legislator_votes
end
