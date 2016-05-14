class Activity < ActiveRecord::Base
  has_many :attendances, dependent: :destroy
  has_many :participants, through: :attendances
  belongs_to :event

  validates_presence_of :scheduled_at
  default_scope { order(scheduled_at: :asc) }
end
