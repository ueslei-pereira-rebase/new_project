class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :cnpj
      t.string :address

      t.timestamps
    end
  end
end
