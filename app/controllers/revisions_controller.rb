class RevisionsController < ApplicationController
  def index
    @game = Game.find_by(id: params[:id])
    @revisions = @game.revisions
  end

  def show
    @revision = Revision.find_by(id: params[:id])
  end

  def new
    @revision = Revision.new
  end

  def create
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
