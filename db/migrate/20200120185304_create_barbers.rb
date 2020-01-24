class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
    create_table :barbers do |t|
      t.string :name
      t.string :email
      t.references :barber_shop
     

      t.timestamps
    end
  end
end
