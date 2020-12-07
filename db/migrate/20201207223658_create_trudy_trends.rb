class CreateTrudyTrends < ActiveRecord::Migration[6.0]
  def change
    create_table :trudy_trends do |t|
      t.DateTime :date
      t.integer :day_of_week
      t.timestamp :queue_top
      t.timestamp :queue_bot
      t.timestamp :admit_top
      t.timestamp :admit_bottom

      t.timestamps
    end
  end
end
