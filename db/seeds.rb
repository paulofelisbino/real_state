property_types = ['Residencial', 'Comercial', 'Terreno']
property_types.map { |property_type| PropertyType.create(name: property_type) }

address = Address.create!(
  address: 'Rua Scuvero',
  neighborhood: 'Cambuci',
  city: 'São Paulo',
  state: 'SP',
  zipcode: '01527-000',
  complement: 'apto 86'
)

rent_insurances = ['Depósito', 'Fiança Bancária', 'Fiador']
rent_insurances.map { |rent_insurance| RentInsurance.create(name: rent_insurance) }

# sell properties
50.times.map do |n|
  reference_number = (n + 1).to_s.rjust(4, '0')
  reference = "C#{reference_number}"

  Property.create!({
    category: :sell,
    description: 'Uma casa.',
    price: rand(1000...100000),
    property_type: PropertyType.first,
    address: address.dup,
    reference: reference,
    size: 48,
    title: "Casa #{n + 1}"
  })
end

# rent properties
50.times.map do |n|
  reference_number = (n + 1).to_s.rjust(4, '0')
  reference = "A#{reference_number}"

  Property.create!({
    category: :rent,
    description: 'Uma casa.',
    price: rand(1000...100000),
    property_type: PropertyType.first,
    address: address.dup,
    reference: reference,
    size: 48,
    title: "Casa #{n + 1}",
    rent_insurances: [RentInsurance.first]
  })
end

User.create!(
  username: 'teste',
  email: 'teste@imobiliaria.com',
  password: '123456'
)
