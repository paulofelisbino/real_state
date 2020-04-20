class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :bathrooms, default: 0
      t.integer :category, index: true
      t.text :description
      t.boolean :furniture, default: false
      t.integer :parking_space, default: 0
      t.boolean :pet_friendly, default: false
      t.integer :property_type_id,
                index: true,
                foreign_key: { to_table: :property_types }
      t.decimal :price, precision: 10, scale: 2
      t.string :reference
      t.integer :rooms, default: 0
      t.integer :size
      t.string :title

      t.timestamps
    end
  end
end
