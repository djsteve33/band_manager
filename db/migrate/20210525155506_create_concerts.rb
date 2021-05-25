class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :band_name
      t.string :date
      t.string :start_time
      t.integer :user_id
      t.integer :venue_id

      t.timestamps
    end
  end
end
