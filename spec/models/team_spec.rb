require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    subject { create(:team) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:team_id) }
    it { should validate_presence_of(:year_id) }
    it { should validate_uniqueness_of(:team_id).scoped_to(:year_id) }
    it { should validate_uniqueness_of(:name).scoped_to(%i[team_id year_id]) }
  end
end
