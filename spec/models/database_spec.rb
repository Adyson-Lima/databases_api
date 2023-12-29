require 'rails_helper'

RSpec.describe Database, type: :model do

  before{@database = Database.new}

  describe 'Testes de preenchimento do model Database' do

    it 'name consegue ser preenchido?' do
      @database.name = 'postgresql'
      expect(@database.name).to eq('postgresql')
    end

    it 'community consegue ser preenchido?' do
      @database.community = ''
      expect(@database.community).to eq('postgres')
    end

  end

end