class AddSlugtoBarbers < ActiveRecord::Migration[6.0]
  def change 
      add_column :barbers, :slug, :string
  end
end
