class LegislatorVote < ApplicationRecord
  belongs_to :legislator
  belongs_to :roll_call

  enum vote: {
    "Aye": 1,
    "Nay": 2,
    "Excused": 3,
    "Absent": 4
  }
end
