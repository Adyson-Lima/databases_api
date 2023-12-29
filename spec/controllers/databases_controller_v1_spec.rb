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

  describe 'GET /api/v1/databases/id' do
    it 'Consegue listar um database especifico e retornar status 200?' do
      get :show, params: {id: @database.id}
      expect(response.body).to include_json(community: 'sqlite')
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/databases' do
    it 'Consegue criar um database e retornar status 201?' do
      post :create, params: {database: {name: 'mongodb', community: 'mongodb'}, format: :json}
      expect(response).to include_json(name: 'mongodb')
      expect(response).to have_http_status(201)
    end
  end

end