class PitchersController < ApplicationController

  def index
    @pitchers = Pitcher.find_each
  end

  def show
    @pitcher = Pitcher.find_by(mlb_id: params[:mlb_id])

    unless @pitcher
      render json: { errors: 'Pitcher Not Found' }
    end
  end
end
