class GamesController < ApplicationController
  def index
    @games = Game.all.sort_by{ |g| g.name.downcase }
  end

  def show
    @game = Game.find_by(id: params[:id])

    if @game
      @latest_game = @game.revisions.last
      render :show
    else
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  def new
    if user_signed_in?
      @game = Game.new
      render :new, :status => 200
    else
      render :file => "#{Rails.root}/public/422.html",  :status => 422
    end
  end

  def create
    @game = Game.new(game_params)

    if user_signed_in?
      @game.update_attributes(creator_id: current_user.id)
      if @game.save
        @revision = Revision.new(game_params)
        @revision.update_attributes(game_id: @game.id)
        @revision.update_attributes(collaborator_id: current_user.id)
        @game.revisions << @revision
        redirect_to game_path(@game)
      else
        render :new
      end
    else
      render :file => "#{Rails.root}/public/422.html",  :status => 422
    end
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :image)
  end
end
