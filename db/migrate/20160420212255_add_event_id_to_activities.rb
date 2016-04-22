class AddEventIdToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :event, index: true
  end
end
