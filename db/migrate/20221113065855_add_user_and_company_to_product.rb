class AddUserAndCompanyToProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :user, null: false, foreign_key: true
    add_reference :products, :company, null: false, foreign_key: true
  end
end
