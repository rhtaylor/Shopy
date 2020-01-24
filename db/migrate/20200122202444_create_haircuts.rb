class CreateHaircuts < ActiveRecord::Migration[6.0]
  def change
    create_table :haircuts do |t|
      t.string :style
      
      t.string :date
      t.references :barber, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
