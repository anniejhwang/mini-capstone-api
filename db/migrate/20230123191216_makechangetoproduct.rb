class Makechangetoproduct < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :description, :text
    add_column :products, :quantity, :integer
    change_column :products, :price, :decimal
  end
end
