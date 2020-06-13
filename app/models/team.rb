class Team < ApplicationRecord
  has_many :stints

  validates :name, presence: true, uniqueness: { scope: %i[team_id year_id] }
  validates :team_id, presence: true, uniqueness: { scope: :year_id }
  validates :year_id, presence: true
end
