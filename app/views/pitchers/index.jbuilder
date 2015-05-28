json.pitchers do
  json.array! @pitchers, partial: 'shared/pitcher', as: :pitcher
end
