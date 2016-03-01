class AddEventImageToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_image, :string
  end
end
