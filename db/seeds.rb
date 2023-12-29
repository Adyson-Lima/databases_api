puts 'criando databases...'
10.times do
  Database.create(name: ['sqlite', 'mariadb', 'postgresql'].sample, community: 'comunidade própria')
end
puts 'databases criados com sucesso!'