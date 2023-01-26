class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :image_url
      t.integer :product_id

      t.timestamps
    end
  end
end
