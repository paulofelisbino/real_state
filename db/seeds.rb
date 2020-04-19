property_types = ['Residencial', 'Comercial', 'Terreno']
property_types.map { |property_type| PropertyType.create(name: property_type) }

100.times.map do |n|
  random_category = rand(0..1)

  reference_letter = 'A'
  reference_letter = 'C' if random_category == 0

  reference_number = (n + 1).to_s.rjust(4, '0')

  reference = "#{reference_letter}#{reference_number}"

  Property.create({
    category: random_category,
    price: rand(1000...100000),
    property_type: PropertyType.find( rand(1..3) ),
    reference: reference,
    title: "Casa #{n + 1}"
  })
end
