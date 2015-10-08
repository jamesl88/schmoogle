class Activity < ActiveRecord::Base
  has_many :participants
  has_many :users, through: :participants

  default_scope { order(scheduled_at: :asc) }
end
