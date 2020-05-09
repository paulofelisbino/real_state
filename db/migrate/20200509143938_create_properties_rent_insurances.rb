class CreatePropertiesRentInsurances < ActiveRecord::Migration[5.2]
  def change
    create_table :properties_rent_insurances, id: false do |t|
      t.references :property, index: true
      t.references :rent_insurance, index: true
    end
  end
end
