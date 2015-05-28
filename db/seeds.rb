require 'csv'

CSV.foreach('public/assignment_trackman_data.csv', headers: true) do |row|
  date    = Date.strptime(row['date'], "%m/%d/%Y")
  game    = Game.find_or_create_by(game_id: row['game_id'], date: date)
  pitcher = Pitcher.find_or_create_by(first_name: row['name_first'], last_name: row['name_last'],
                                      mlb_id: row['mlbid'], throws: row['throws'])
  PitcherGame.find_or_create_by(pitcher: pitcher, game: game)
  pitcher.pitches.create(speed: row['pitch_speed'], pitch_type: row['pitch_type'],
                         swing: row['swing'] == 'swing' ? true : false,
                         horizontal_movement: row['horizontal_movement'],
                         vertical_movement: row['vertical_movement'],
                         spin_rate: row['spin_rate'], game: game)
end
