class CreateRentInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :rent_insurances do |t|
      t.string :name

      t.timestamps
    end
  end
end
