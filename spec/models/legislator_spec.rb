require 'rails_helper'

RSpec.describe Legislator, type: :model do
  describe 'relationships' do
    it { should have_many :legislator_votes }
  end
end
