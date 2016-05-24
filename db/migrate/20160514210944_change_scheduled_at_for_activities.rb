class ChangeScheduledAtForActivities < ActiveRecord::Migration
  def change
    change_column :activities, :scheduled_at, :time
  end
end
