class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @games = Game.recent
  end
end
