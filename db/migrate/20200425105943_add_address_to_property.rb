class AddAddressToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :address_id, :integer, index: true
  end
end
