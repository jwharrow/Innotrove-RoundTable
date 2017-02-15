require 'rails_helper'

describe ApplicationController do
  describe 'GET #index' do
    it 'responds with status code 200' do
      get :index
      expect(response).to have_http_status 200
    end

    it 'assigns @games' do
      get :index
      expect(assigns(:games)).to eq(Game.recent)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
