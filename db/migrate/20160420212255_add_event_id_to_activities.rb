class AddEventIdToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :events, index: true
  end
end
