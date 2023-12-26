class RollCall < ApplicationRecord
  belongs_to :bill
  has_many :legislator_votes
  has_many :legislators, through: :legislator_votes

  enum chamber: {
    "House": 21,
    "Senate": 22
  }

  def aye_voters
    # 1 is the legislator_vote enum value for "Aye"
    legislators.where(legislator_votes: { vote: 1 }).order(:party)
  end
  
  def nay_voters
    # 2 is the legislator_vote enum value for "Nay"
    legislators.where(legislator_votes: { vote: 2 })
  end
  
  def excused_voters
    # 3 is the legislator_vote enum value for "Excused"
    legislators.where(legislator_votes: { vote: 3 })
  end
  
  def absent_voters
    # 4 is the legislator_vote enum value for "Absent"
    legislators.where(legislator_votes: { vote: 4 })
  end

  def self.house_votes
    @@house_votes ||= joins(:legislator_votes)
    .group('roll_calls.id')
    .having('COUNT(legislator_votes.id) = ?', 65)
  end
end
