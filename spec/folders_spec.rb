RSpec.describe 'Testes de verificação de pastas do projeto' do

  it 'pasta spec/models existe?' do
    expect(Dir.exist?('spec/models')).to eq(true)
  end

end