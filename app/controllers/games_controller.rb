class GamesController < ApplicationController
  def index
    @games = Game.all.sort_by{ |g| g.name.downcase }
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
    @game.update_attributes(creator_id: current_user.id)
    # p "GameCreate" * 100
    # p game_params
    if @game.save
      @revision = Revision.new(game_params)
      @revision.update_attributes(game_id: @game.id)
      @revision.update_attributes(collaborator_id: current_user.id)
      @game.revisions << @revision
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
