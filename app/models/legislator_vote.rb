class LegislatorVote < ApplicationRecord
  belongs_to :legislator
  belongs_to :roll_call
end
