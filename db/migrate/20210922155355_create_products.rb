class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code, null: false, index: { unique: true }
      t.string :name, null: false
      t.decimal :price, null: false, default: 0, precision: 6, scale: 2

      t.timestamps
    end
  end
end
