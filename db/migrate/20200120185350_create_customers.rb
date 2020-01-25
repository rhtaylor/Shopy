class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.integer :phone_number 
      t.string :uid, default: nil
      t.string :password_digest
      t.timestamps
    end
  end
end
