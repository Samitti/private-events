class AddLocationStartsAtToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :location, :string
    add_column :events, :starts_at, :datetime
  end
end
