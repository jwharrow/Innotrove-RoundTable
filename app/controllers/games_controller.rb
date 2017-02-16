class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find_by(id: params[:id])   
  end

  def update
    @game = Game.find_by(id: params[:id])

    @game.update_attributes(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def patch
    @game = Game.find_by(id: params[:id])

    @game.update_attributes(game_params)

    if @game.save
      redirect_to game_path(@game)
    else
      render :edit
    end 
  end


  def create
    @game = Game.new(game_params)
    # TODO TAKE THIS LINE OUT!!!!
    @game.update_attributes(creator_id: 1)

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :description)
  end
end
