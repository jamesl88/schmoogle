class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  default_scope { joins(:activity).order("activities.scheduled_at asc") }
end
