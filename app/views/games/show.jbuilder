json.game do
  json.game_id @game.game_id
  json.total_pitchers @game.pitchers.size
  json.pitchers do
    json.array! @game.pitchers, partial: 'shared/pitcher', as: :pitcher
  end
end
