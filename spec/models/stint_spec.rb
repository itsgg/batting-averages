require 'rails_helper'

RSpec.describe Stint, type: :model do
  describe 'validations' do
    subject { create(:stint) }
    it { should validate_presence_of(:player) }
    it { should validate_presence_of(:team) }
    it { should validate_presence_of(:year_id) }
    it { should validate_uniqueness_of(:player).scoped_to(%i[team_id year_id]) }
  end
end
