class RemoveUserIdFromParticipants < ActiveRecord::Migration
  def change
    remove_column :participants, :user_id
  end
end
