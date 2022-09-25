# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Utilitarios

def extract_info_location(location)
    place = Place.new
    place.latitude = location['lat']
    place.longitude = location['lon']
    place.address = location['address']['suburb']
    place.city = location['address']['city']
    place.state = location['address']['state']
    place.state_code = location['address']['state_code']
    place.postal_code = location['address']['postcode']
    place.country = location['address']['country']
    place.country_code = location['address']['country_code']
    place.save
    place
end

# Usuarios
User.create!(email: '1@email.com', password: '12345678', name: 'Felipe Torres',
    phone_number: 86999123456,permit_phone_number: true, permit_email: true,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: true,
    address: 'Quadra xx Bloco XX apt XXX, Morada Nova 1', accepted_cookies: true)

User.create!(email: '2@email.com', password: '12345678', name: 'Carlos Andre',
    phone_number: 85330455904, permit_phone_number: false, permit_email: true,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: true,
    address: 'Universidade Federal Do Piauí, ministro Petronio Portela', accepted_cookies: true)

User.create!(email: '3@email.com', password: '12345678', name: 'Paulo Andre',
    phone_number: 98971238473, permit_phone_number: true, permit_email: false,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: false,
    address: nil, accepted_cookies: true, score: 11, services_realized: 3)

User.create!(email: '4@email.com', password: '12345678', name: 'Gustavo Souza',
    phone_number: nil, permit_phone_number: false, permit_email: false,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: false,
    address: nil, accepted_cookies: true)

User.create!(email: '5@email.com', password: '12345678', name: 'Gustavo Assunção',
    phone_number: nil, permit_phone_number: false, permit_email: false,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: true,
    address: 'Bairro São Pedro, Centro, numero XXXX', accepted_cookies: true)

User.create!(email: '6@email.com', password: '12345678', name: 'Tiago Rocha',
    phone_number: 76990219387, permit_phone_number: true, permit_email: true,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: false,
    address: 'Bairro São Pedro, Centro, numero XXXX', accepted_cookies: false)

User.create!(email: '7@email.com', password: '12345678', name: 'Gian Camara',
    phone_number: 22139940592, permit_phone_number: true, permit_email: true,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: true,
    address: 'Bairro São Paulo, numero XXXX, bloco XX', accepted_cookies: false)

User.create!(email: '8@email.com', password: '12345678', name: 'João Felipe Marques',
    phone_number: 86900192834, permit_phone_number: true, permit_email: true,
    accepted_terms_of_use: true, accepted_privacy_policy: true, isContratante: true,
    address: 'Morada Nova 2, casa XXX bloco XX', accepted_cookies: false)


# Servicos
Service.create!(user_id: 1, user_selected_id: nil, title: 'Tosar Cachorro Bravo',
    description:'Necessito de ajuda para tosar meu cachorro, ele é muito nervoso e bravo',
    limit_date: nil, value: 159, finished: false, finished_prestador: false)

Service.create!(user_id: 2, user_selected_id: nil, title: 'Lavar Carro',
    description:'Preciso de alguem para lavar meu carro nesse sabado 30/09, está com sujeira de barro',
    limit_date: "2022-09-28 00:00:00", value: 70, finished: false, finished_prestador: false)

Service.create!(user_id: 7, user_selected_id: nil, title: 'Limpar Casa',
    description:'Preciso de alguem para limpar minha casa',
    limit_date: nil, value: 90, finished: false, finished_prestador: false)

Service.create!(user_id: 7, user_selected_id: nil, title: 'Corrigir Texto',
    description:'Preciso de alguem para corrigri a escrita de um texto que produzi',
    limit_date: nil, value: 120, finished: false, finished_prestador: false)

Service.create!(user_id: 2, user_selected_id: nil, title: 'Instalar Portão',
    description:'Preciso de uma pessoa que saiba instalar portão para minha garagem',
    limit_date: nil, value: 130, finished: false, finished_prestador: false)

Service.create!(user_id: 7, user_selected_id: nil, title: 'Ajeitar Porta de Madeira',
    description:'Preciso de alguem para ajeitar minha porta de madeira da minha casa',
    limit_date: nil, value: 200, finished: false, finished_prestador: false)

Service.create!(user_id: 1, user_selected_id: nil, title: 'Limpar meu computador',
    description:'Preciso limpar meu computador ele está muito sujo',
    limit_date: "2022-09-28 00:00:00", value: 300, finished: false, finished_prestador: false)

Service.create!(user_id: 7, user_selected_id: nil, title: 'Varrer Casa',
    description:'Estou sem tempo, preciso de alguem para varrer minha casa',
    limit_date: nil, value: 70, finished: false, finished_prestador: false)

Service.create!(user_id: 7, user_selected_id: nil, title: 'Instalar TV na parede',
    description:'Preciso de alguem que instale uma TV na parede',
    limit_date: nil, value: 50, finished: false, finished_prestador: false)

Service.create!(user_id: 7, user_selected_id: nil, title: 'Fazer resumo de um livro',
    description:'Preciso de alguem que me faça um resumo de um livro de 200 paginas',
    limit_date: nil, value: 230, finished: false, finished_prestador: false)

Service.create!(user_id: 8, user_selected_id: nil, title: 'Cabo de internet na casa',
    description:'Preciso de alguem para passar o cabo de internet por cima da casa',
    limit_date: "2022-09-28 00:00:00", value: 50, finished: false, finished_prestador: false)

Service.create!(user_id: 8, user_selected_id: nil, title: 'Me ajudar a gravar',
    description:'Preciso de alguem pque saiba gravar, preciso fazer um trabalho de escola',
    limit_date: "2022-10-20 00:00:00", value: 100, finished: false, finished_prestador: false)

Service.create!(user_id: 8, user_selected_id: nil, title: 'Costurar roupa rasgada',
    description:'Preciso de alguem para costurar algumas roupas rasgadas',
    limit_date: nil, value: 200, finished: false, finished_prestador: false)

Service.create!(user_id: 8, user_selected_id: nil, title: 'Gomar Roupa',
    description:'Estou sem tempo, preciso de alguem para gomar roupas',
    limit_date: nil, value: 120, finished: false, finished_prestador: false)

Service.create!(user_id: 8, user_selected_id: nil, title: 'Censertar Ventilador',
    description:'Meus dois ventiladores quebraram! preciso de alguem que conserte',
    limit_date: nil, value: 300, finished: false, finished_prestador: false)

Service.create!(user_id: 8, user_selected_id: nil, title: 'Formatar Celular',
    description:'Meus celular está travando muito, preciso que alguem formate',
    limit_date: nil, value: 110, finished: false, finished_prestador: false)

Service.create!(user_id: 8, user_selected_id: nil, title: 'Formatar Computador',
    description:'Meus computador está travando muito, preciso que alguem formate',
    limit_date: nil, value: 110, finished: false, finished_prestador: false)

# Servicos ja realizados
Service.create!(user_id: 1, user_selected_id: 3, title: 'Tosar meu cachorro',
    description:'Meu cachorro está com muitos pelos, preciso de um tosador',
    limit_date: nil, value: 159, finished: true, finished_prestador: true)

Service.create!(user_id: 8, user_selected_id: 3, title: 'Cuidar do meu cachorro',
    description:'Preciso de alguem que cuide do meu cachorro por dois dias',
    limit_date: "2022-07-10 00:00:00", value: 400, finished: true, finished_prestador: true)

# Servicos em andamento
Service.create!(user_id: 1, user_selected_id: 4, title: 'Passear com cachorro',
    description:'Gostaria de alguem para passear com meu cachorro',
    limit_date: nil, value: 45, finished: false, finished_prestador: false)

Service.create!(user_id: 1, user_selected_id: 6, title: 'Cuidar de cachorro',
    description:'Gostaria de alguem para cuidar do meu cachorro no domingo',
    limit_date: nil, value: 55, finished: false, finished_prestador: false)

Service.create!(user_id: 1, user_selected_id: 3, title: 'Montar meu computador',
    description:'Comprei as peças do meu computador, mas preciso de ajuda para monta-lo. Preciso de Urgencia é trabalho',
    limit_date: "2022-10-02 00:00:00", value: 300, finished: false, finished_prestador: false)
# User_services - Inscricao de prestadores para um servico (3,4,6)
user3 = User.find(3)
user4 = User.find(4)
user6 = User.find(6)
service1 = Service.find(1)
UserService.create!(user: user3, service: service1,
    comment:'Tenho experiência em cuidar de cachorros bravos, posso ser de grande ajuda')

UserService.create!(user: user4, service: service1,
    comment:'Já cuidei de alguns cachorros, mas não bravos, posso tentar auxiliar')

UserService.create!(user: user6, service: service1,
    comment:'Trabalho em petshop e ja faço tosa de animais')

# User_services realizados
service18 = Service.find(18)
service19 = Service.find(19)
UserService.create!(user: user3, service: service18,
    comment:'Ja tosei cachorros bravos antes, consigo realiar o serviço')

UserService.create!(user: user3, service: service19,
    comment:'Sou cuidador de cachorros, tenho o manejo e convivencia com varios')

# User_Places
user1 = User.find(1)

user_geocode = UserPlace.new
user_geocode.user = user1
user_geocode.place = extract_info_location(Geocoder.search(['-5.126415', '-42.789010']).first.data)
user_geocode.save

user2 = User.find(2)
user_geocode = UserPlace.new
user_geocode.user = user2
user_geocode.place = extract_info_location(Geocoder.search(['-5.126435', '-42.789030']).first.data)
user_geocode.save

user_geocode = UserPlace.new
user_geocode.user = user3
user_geocode.place = extract_info_location(Geocoder.search(['-5.126445', '-42.789040']).first.data)
user_geocode.save

user_geocode = UserPlace.new
user_geocode.user = user6
user_geocode.place = extract_info_location(Geocoder.search(['-5.126450', '-42.789045']).first.data)
user_geocode.save

user_geocode = UserPlace.new
user_geocode.user = User.find(7)
user_geocode.place = extract_info_location(Geocoder.search(['-5.226450', '-38.789045']).first.data)
user_geocode.save