json.pitcher do
  json.partial! 'shared/pitcher', pitcher: @pitcher

  json.games @pitcher.games.order("date ASC") do |game|
    json.game_id game.game_id
    json.date game.date
    json.total_number_of_pitches @pitcher.pitches_by_game(game).size
    json.pitch_types @pitcher.pitch_types do |pitch_type|
      json.pitch_type pitch_type
      json.number_of_pitches @pitcher.pitches_by_game(game, pitch_type).size
      json.partial! 'shared/avg_metrics', pitcher: @pitcher, pitch_type: pitch_type, game: game
    end
  end
end
