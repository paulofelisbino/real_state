class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :neighborhood
      t.string :city
      t.string :state, limit: 2
      t.string :zipcode
      t.string :complement
    end
  end
end
