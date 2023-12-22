require 'rails_helper'

RSpec.describe LegislatorVote, type: :model do
  describe 'relationships' do
    it { should belong_to :legislator }
    it { should belong_to :roll_call }
  end
end
