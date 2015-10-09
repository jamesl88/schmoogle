class Activity < ActiveRecord::Base
  has_many :participants
  has_many :users, through: :participants

  validates_presence_of :scheduled_at

  default_scope { order(scheduled_at: :asc) }
end
