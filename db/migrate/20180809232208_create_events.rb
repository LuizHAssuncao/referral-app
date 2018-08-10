class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :points
      t.string :descriptions
      t.string :event_type

      t.timestamps
    end
  end
end
