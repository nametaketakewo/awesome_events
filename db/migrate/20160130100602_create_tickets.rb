class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :event, null: false, index: true, foreign_key: true
      t.string :comment

      t.timestamps
    end
    add_index :tickets, [:user_id, :event_id], unique: true
    add_index :tickets, [:event_id, :user_id], unique: true
  end
end
