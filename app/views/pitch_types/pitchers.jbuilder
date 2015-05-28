json.total_pitchers @pitchers.size
json.pitchers @pitchers do |pitcher|
  json.partial! 'shared/pitcher', pitcher: pitcher
  json.pitch_type @pitch_type
  json.number_of_pitches pitcher.pitches_by_pitch_type(@pitch_type).size
  json.partial! 'shared/avg_metrics', pitcher: pitcher, pitch_type: @pitch_type, game: nil
  json.max_speed pitcher.pitches_by_pitch_type(@pitch_type).maximum("speed")
  json.min_speed pitcher.pitches_by_pitch_type(@pitch_type).minimum("speed")
end
