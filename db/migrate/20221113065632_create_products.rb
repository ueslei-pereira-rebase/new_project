class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :body
      t.decimal :price, precision: 8, scale: 2
      t.integer :status, null: false, default: 0
      t.integer :amount, null: false
      t.integer :interested_amount, default: 0

      t.timestamps
    end
  end
end
