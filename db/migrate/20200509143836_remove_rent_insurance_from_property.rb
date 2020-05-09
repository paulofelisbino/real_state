class RemoveRentInsuranceFromProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :rent_insurance
  end
end
