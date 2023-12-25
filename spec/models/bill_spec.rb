require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe 'relationships' do
    it { should have_many :roll_calls }
    it { should have_many(:legislator_votes).through(:roll_calls) }
  end

  describe 'Instance methods' do
    describe '#house_thirds' do
      xit "Returns voting results for all House Thirds votes (thirds are the final up/down vote for a bill in the House chamber)" do
        
      end
    end

    describe '#senate_thirds' do
      xit "Returns voting results for all Senate Thirds votes (thirds are the final up/down vote for a bill in the Senate chamber)" do

      end
    end
  end
end