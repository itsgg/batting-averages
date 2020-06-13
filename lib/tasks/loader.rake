require 'csv'

TEAMS_CSV_FILE = File.join(Rails.root, 'db', 'Teams.csv')
BATTING_CSV_FILE = File.join(Rails.root, 'db', 'Batting.csv')

# NOTE:
# The rake tasks are idempotent.
# It will not create duplicates when run multiple times.
# It will load the latest hits and at_bats

namespace :loader do
  desc 'Load teams'
  task teams: :environment do
    puts TEAMS_CSV_FILE
    CSV.foreach(TEAMS_CSV_FILE, headers: true) do |row|
      name = row['name']
      team_id = row['teamID']
      year_id = row['yearID']

      Team.find_or_create_by! name: name, team_id: team_id, year_id: year_id
    end

    puts "Loaded #{Team.count} teams"
  end

  desc 'Load players and stints'
  task stints: :environment do
    puts 'Loading stints & players'
    CSV.foreach(BATTING_CSV_FILE, headers: true) do |row|
      player_id = row['playerID']
      year_id = row['yearID']
      team_id = row['teamID']
      hits = row['H']
      at_bats = row['AB']

      player = Player.find_or_create_by! player_id: player_id
      team = Team.find_by year_id: year_id, team_id: team_id
      stint =
        Stint.find_or_create_by! team: team, player: player, year_id: year_id
      stint.update_columns hits: hits, at_bats: at_bats
    end

    puts "Loaded #{Player.count} players"
    puts "Loaded #{Stint.count} stints"
  end
end
