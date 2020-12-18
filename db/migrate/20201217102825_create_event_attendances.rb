class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances do |t|
      t.references :attendee, foreign_key: {to_table: :users}, null: false 
      t.references :attended_event, foreign_key: {to_table: :events}, null: false 
      t.timestamps
    end
  end
end
