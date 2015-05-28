class PitcherGame < ActiveRecord::Base
  belongs_to :pitcher
  belongs_to :game
end
