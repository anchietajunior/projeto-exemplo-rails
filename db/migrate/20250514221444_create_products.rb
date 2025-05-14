class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.references :category, null: false, foreign_key: true
      t.string :image
      t.integer :quantity

      t.timestamps
    end
  end
end
