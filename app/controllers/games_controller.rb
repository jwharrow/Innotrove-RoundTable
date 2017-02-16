class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @latest_game = @game.revisions.last
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    # TODO TAKE THIS LINE OUT!!!!
    @game.update_attributes(creator_id: current_user.id)
    p "GameCreate" * 100
    p game_params
    if @game.save
      @game.revisions.build(game_params)
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :image)
  end
end
