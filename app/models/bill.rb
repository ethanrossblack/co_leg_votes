class Bill < ApplicationRecord
  has_many :roll_calls
  has_many :legislator_votes, through: :roll_calls

  enum bill_type: {
    "Bill": 1,
    "Resolution": 2,
    "Concurrent Resolution": 3,
    "Joint Resolution": 4,
    "Memorial": 8,
    "Joint Memorial": 12
  }
  enum bill_status: {
    "Introduced": 1,
    "Engrossed": 2,
    "Enrolled": 3,
    "Passed": 4,
    "Vetoed": 5,
    "Failed": 6
  }
end
