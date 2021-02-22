class AddDateToSighting < ActiveRecord::Migration[6.0]
  def change
    add_column :sightings, :date, :datetime
  end
end
