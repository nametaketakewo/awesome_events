class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :owner_id
      t.string :name, null: false
      t.string :place, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.text :content, null: false

      t.timestamps
    end
    add_index :events, :owner_id
  end
end
