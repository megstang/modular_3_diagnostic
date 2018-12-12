class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.text :address
      t.string :fuel_type
      t.integer :distance
      t.string :access_time
    end
  end
end
