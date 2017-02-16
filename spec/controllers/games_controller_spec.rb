require 'rails_helper'

describe GamesController do
  let!(:user) { User.first || User.create!(username: "NickDevlin", email: "nick@devlins.gov", password: "opensource!")}
  let!(:game) { Game.create!(name: "Battleship", description: "BUT WITH ROCKS", creator: user)}

  describe 'GET #index' do
    it 'responds with status code 200' do
      get :index
      expect(response).to have_http_status 200
    end

    it 'assigns @games' do
      get :index
      expect(assigns(:games)).to eq(Game.all)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'responds with status code 200' do
      get :new
      expect(response).to have_http_status 200
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # describe 'GET #edit' do
  #   it 'responds with status code 200' do
  #     get :edit, params: { id: game.id }
  #     expect(response).to have_http_status 200
  #   end

  #   it 'renders the :edit template' do
  #     get :edit, params: { id: game.id }
  #     expect(response).to render_template(:edit)
  #   end
  # end

  # describe 'PUT #update' do
  #   context "with good data" do
  #     it 'responds with status code 302' do
  #       put(:update, params: {id: game.id, game: { name: "Battleship with Rocks" }})
  #       expect(response).to have_http_status 302
  #     end

  #     it 'updates the database' do
  #       put(:update, params: {id: game.id, game: { name: "Battleship with Rocks" }})
  #       @game = Game.find_by(id: game.id)
  #       expect(@game.name).to eq("Battleship with Rocks")
  #     end
  #   end
  #   context "with bad data" do
  #     it 'renders edit page' do
  #       put(:update, params: {id: game.id, game: { name: "" }})
  #       expect(response).to render_template(:edit)
  #     end
    # end
  # end

  describe 'GET #show' do
    it 'responds with status code 200' do
      get :show, params: { id: game.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct game as @game" do
      get :show, params: { id: game.id }
      expect(assigns(:game)).to eq(game)
    end

    it 'renders the :show template' do
      get :show, params: { id: game.id }
      expect(response).to render_template(:show)
    end
  end
end
