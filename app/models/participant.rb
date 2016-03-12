class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  default_scope { joins(:activity).order("activities.scheduled_at asc") }
  scope :attending, -> { where(attending: true) }

  delegate :name, :schedule, to: :activity, prefix: true
end
