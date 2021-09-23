class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :name, null: false
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
