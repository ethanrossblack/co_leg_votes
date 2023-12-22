require 'rails_helper'

RSpec.describe Bill, type: :model do
  describe 'relationships' do
    it { should have_many :roll_calls }
    it { should have_many(:legislator_votes).through(:roll_calls) }
  end
end