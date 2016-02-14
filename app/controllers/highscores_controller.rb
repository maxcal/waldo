class HighscoresController < ApplicationController
  respond_to :json, :html
  def create
    @highscore = Highscore.create(high_scores_params)
    respond_with(@high_score, 201)
  end

  def index
    @highscores = Highscore.sort(:score).all
  end

  def show
    @highscore = Highscore.find(params[:id])
  end

  private
    def high_score_params
      params.require(:highscore).permit(:username, :time, :score)
    end
end
