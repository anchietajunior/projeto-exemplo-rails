class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.datetime :is_present_at

      t.timestamps
    end
  end
end
