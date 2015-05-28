class Pitcher < ActiveRecord::Base
  has_many :pitcher_games, dependent: :destroy
  has_many :games, through: :pitcher_games
  has_many :pitches, dependent: :destroy

  def pitch_types
    pitches.select(:pitch_type).distinct.pluck(:pitch_type)
  end

  def pitches_by_game(game, pitch_type = nil)
    pitches = self.pitches.where(game: game)
    pitch_type.present? ? pitches.where(pitch_type: pitch_type) : pitches
  end

  def pitches_by_pitch_type(pitch_type)
    self.pitches.where(pitch_type: pitch_type)
  end

  def avg_of_metric_by(metric, pitch_type, game = nil)
    pitches = game.present? ? pitches_by_game(game, pitch_type) : pitches_by_pitch_type(pitch_type)

    if metric == "spin_rate"
      pitches.where("spin_rate != 0").average(metric).to_f
    elsif metric == "swing"
      pitches.size > 0 ? 100 * (pitches.where("swing = true").size.to_f/pitches.size.to_f) : 0
    else
      pitches.average(metric).to_f
    end
  end
end
