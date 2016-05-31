class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_id
      t.string :company
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :phone

      t.timestamps null: false
    end
  end
end
