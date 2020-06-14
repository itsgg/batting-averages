require 'optparse'
require 'rest-client'
require 'json'
require 'terminal-table'

API_ENDPOINT = 'http://localhost:3000/players'

options = {}
OptionParser.new do |opt|
  opt.on('--year YEAR') { |o| options[:year] = o }
  opt.on('--team TEAM NAME') { |o| options[:team] = o }
end
  .parse!

response =
  RestClient.get "#{API_ENDPOINT}?year=#{options[:year]}&team=#{options[:team]}"

players = JSON.parse(response.body)
table =
  Terminal::Table.new do |t|
    t << ['PlayerID', 'YearId', 'Team name(s)', 'Batting Average']
    t << :separator
    players.each_with_index do |player, index|
      t <<
        [
          player['name'],
          player['year_id'],
          player['teams'],
          player['batting_average']
        ]
      t << :separator unless index == players.size - 1
    end
  end
puts table
