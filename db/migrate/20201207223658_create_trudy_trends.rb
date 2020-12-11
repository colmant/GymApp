class CreateTrudyTrends < ActiveRecord::Migration[6.0]
  def change
    create_table :trudy_trends do |t|
      t.datetime :time
      t.timestamps
    end
  end
end
