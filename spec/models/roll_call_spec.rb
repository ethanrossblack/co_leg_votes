require 'rails_helper'

RSpec.describe RollCall, type: :model do
  describe 'relationships' do
    it { should belong_to :bill }
    it { should have_many :legislator_votes }
    it { should have_many(:legislators).through(:legislator_votes) }
  end

  describe 'instance methods' do
    describe '#aye_voters' do
      xit 'returns an array of Legislators who voted "Aye" on the roll_call' do

      end
    end

    describe '#nay_voters' do
      xit 'returns an array of Legislators who voted "Nay" on the roll_call' do

      end
    end

    describe '#excused_voters' do
      xit 'returns an array of Legislators marked as "Excused" on the roll_call' do

      end
    end

    describe '#absent_voters' do
      xit 'returns an array of Legislators marked as "Absent" on the roll_call' do

      end
    end
  end
end
