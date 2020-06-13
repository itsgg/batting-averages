class Stint < ApplicationRecord
  belongs_to :player
  belongs_to :team

  validates :player, presence: true, uniqueness: { scope: %i[team_id year_id] }
  validates :team, presence: true
  validates :year_id, presence: true

  def self.filter(params)
    return [] if params[:team].blank? && params[:year].blank?

    stints = Stint.joins(:team).joins(:player).select(
      :id,
      :player_id,
      :year_id,
      :team_id,
      :at_bats,
      :hits,
      'teams.name as team_name',
      'players.player_id as player_name'
    )
    stints = stints.send(:where, {year_id: params[:year]}) if params[:year].present?
    stints.send(:where, {'teams.name': params[:team]}) if params[:team].present?
    stints
  end
end
