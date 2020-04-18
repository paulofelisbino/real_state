class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.decimal :price, precision: 5, scale: 2
      t.string :title

      t.timestamps
    end
  end
end
