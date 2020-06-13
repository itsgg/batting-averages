class Player < ApplicationRecord
  has_many :stints

  validates :player_id, presence: true, uniqueness: true

  def self.list(params)
    Stint.filter(params).group_by(&:player_name).map do |player_name, stint|
      hits = stint.sum(&:hits).to_f
      at_bats = stint.sum(&:at_bats).to_f
      batting_average = at_bats > 0 ? (hits / at_bats).round(3) : 'NA'

      {
        name: player_name,
        year_id: stint.first.year_id,
        teams: stint.map(&:team_name).uniq.join(', '),
        at_bats: stint.map(&:at_bats),
        hits: stint.map(&:hits),
        batting_average: batting_average
      }
    end
  end
end
