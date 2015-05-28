class Pitch < ActiveRecord::Base
  belongs_to :pitcher
  belongs_to :game

  def self.pitch_types
    select(:pitch_type).distinct.pluck(:pitch_type)
  end
end
