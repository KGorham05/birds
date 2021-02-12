class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.integer :bird_id
      t.float :lat
      t.float :long
      t.string :description

      t.timestamps
    end
  end
end
