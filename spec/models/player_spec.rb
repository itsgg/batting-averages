require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    subject { create(:player) }
    it { should validate_presence_of(:player_id) }
    it { should validate_uniqueness_of(:player_id) }
  end
end
