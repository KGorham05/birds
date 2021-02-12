class CreateBirds < ActiveRecord::Migration[6.0]
  def change
    create_table :birds do |t|
      t.string :common_name
      t.string :latin_name

      t.timestamps
    end
  end
end
