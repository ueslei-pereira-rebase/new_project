class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :cpf, :string
    add_column :users, :agree, :boolean
    add_column :users, :subsidiary, :string
    add_column :users, :department, :string
    add_column :users, :string, :string
    add_column :users, :phone, :string
    add_column :users, :mobile, :string
    add_column :users, :status, :integer, null: false, default: 0
    add_column :users, :gender, :integer
  end
end
