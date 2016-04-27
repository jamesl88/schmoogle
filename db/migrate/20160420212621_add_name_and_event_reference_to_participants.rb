class AddNameAndEventReferenceToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :name, :string
    add_reference :participants, :event
    remove_column :participants, :activity_id, :integer
    remove_column :participants, :attending, :integer
  end
end
