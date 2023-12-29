require 'rails_helper'

RSpec.describe Api::V1::DatabasesController, type: :controller do

  before{@database = Database.create(name: 'sqlite', community: 'sqlite')}

  describe 'GET /api/v1/databases' do
    it 'Consegue listar todos os databases e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end