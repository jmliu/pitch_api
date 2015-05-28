class PitchTypesController < ApplicationController

  def index
    @pitch_types = Pitch.pitch_types
  end

  def pitchers
    @pitchers, @pitch_type = [], params[:pitch_type]
    Pitcher.find_each do |pitcher|
      if pitcher.pitch_types.include?(@pitch_type)
        @pitchers << pitcher
      end
    end
  end

  def pitcher
    @pitch_type = params[:pitch_type]
    @pitcher = Pitcher.find_by(mlb_id: params[:mlb_id])

    unless @pitcher
      render json: { errors: 'Pitcher Not Found' }
    end
  end
end
