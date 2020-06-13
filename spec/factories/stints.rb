FactoryBot.define do
  factory :stint do
    player { create(:player) }
    team { create(:team) }
    year_id { '2020' }
    hits { 4 }
    at_bats { 10 }
  end
end
