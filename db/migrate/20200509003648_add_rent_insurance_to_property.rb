class AddRentInsuranceToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :rent_insurance, :integer, index: true
  end
end
