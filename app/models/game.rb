class Game < ActiveRecord::Base
  has_many :pitches, dependent: :destroy
  has_many :pitcher_games
  has_many :pitchers, through: :pitcher_games
end
