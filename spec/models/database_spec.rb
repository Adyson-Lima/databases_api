require 'rails_helper'

RSpec.describe Database, type: :model do

  before{@database = Database.new}

  describe 'Testes de preenchimento do model Database' do

    it 'name consegue ser preenchido?' do
      @database.name = 'postgresql'
      expect(@database.name).to eq('postgresql')
    end

    it 'community consegue ser preenchido?' do
      @database.community = 'postgres'
      expect(@database.community).to eq('postgres')
    end

  end

  describe 'Testes de validação do model Database' do

    it 'objeto database valido com campos obrigatorios preenchidos?' do
      database = Database.new
      expect(database).to be_valid
    end

  end

end