class ChangePropertyPriceToInteger < ActiveRecord::Migration[5.2]
  def up
    rename_column :properties, :price, :price_cents
    change_column :properties, :price_cents, :integer, limit: 8
  end

  def down
    change_column :properties, :price_cents, :decimal, precision: 12, scale: 2
    rename_column :properties, :price_cents, :price
  end
end
