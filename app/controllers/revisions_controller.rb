class RevisionsController < ApplicationController
  def index
    @game = Game.find_by(id: params[:game_id])
    @revisions = @game.revisions
  end

  def show
    p 'RRRR' * 100
    p params
    @game = Game.find_by(id: params[:game_id])
    @revision = @game.revisions.last
  end

  def new
    @game = Game.find_by(id: params[:game_id])
    @revision = Revision.new
  end

  def create
    @game = Game.find_by(id: params[:game_id])
    @revision = Revision.new(revision_params)
    @revision.update_attributes(game_id: params[:game_id])

    if user_signed_in?
      @revision.update_attributes(collaborator_id: current_user.id)
    end

    if @revision.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  private

  def revision_params
    params.require(:revision).permit(:name, :description)
  end
end
