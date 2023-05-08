class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :cuisine

      t.timestamps # create two new columns created_at ad updated_at
    end
  end
end
