class HighscoresController < ApplicationController
  respond_to :json, :html

  def create
    @highscore = Highscore.create(highscore_params)
    respond_with @highscore
  end

  def index
    @highscores = Highscore.order(score: :desc).all
    respond_with @highscores
  end

  def show
    @highscore = Highscore.find(params[:id])
    respond_with @highscore
  end

  private
    def highscore_params
      params.require(:highscore).permit(:username, :time, :score)
    end
end
