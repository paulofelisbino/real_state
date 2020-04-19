# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

property_types = ['Residencial', 'Comercial', 'Terreno']
property_types.map { |property_type| PropertyType.create(title: property_type) }

properties = [
  {
    category: Property.categories[:rent],
    price: 1000,
    property_type: PropertyType.first,
    reference: 'A0001',
    title: 'Casa 1'
  },
  {
    category: Property.categories[:rent],
    price: 200000,
    property_type: PropertyType.second,
    reference: 'A0002',
    title: 'Casa 2'
  }
]
properties.map { |property| Property.create(property) }
