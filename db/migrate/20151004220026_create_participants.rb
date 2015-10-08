class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :user
      t.references :activity
      t.boolean :attending, default: false
      t.timestamps null: false
    end
  end
end
