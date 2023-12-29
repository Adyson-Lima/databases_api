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
      expect(response.body).to include_json(name: 'mongodb')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/databases/id' do
    it 'Consegue atualizar um database e retornar status 200?' do
      database = Database.last
      patch :update, params: {database: {name: 'postgres', community: 'postgres'}, id: database.id}
      expect(response.body).to include_json(name: 'postgres')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/databases/id' do
    it 'Consegue excluir um database e retornar status 204?' do
      database = Database.last
      delete :destroy, params: {id: database.id}
      expect(Database.all).not_to include(database)
      expect(response).to have_http_status(204)
    end
  end

end