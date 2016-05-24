class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.boolean :attending, default: false
      t.references :participant
      t.references :activity
      t.timestamps null: false
    end
  end
end
