class AddShowAddressToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :show_address, :boolean, default: false
  end
end
