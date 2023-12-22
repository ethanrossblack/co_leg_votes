require 'rails_helper'

RSpec.describe RollCall, type: :model do
  describe 'relationships' do
    it { should belong_to :bill }
    it { should have_many :legislator_votes }
    it { should have_many(:legislators).through(:legislator_votes) }
  end
end
