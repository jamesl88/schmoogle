class Activity < ActiveRecord::Base
  has_many :attendances, dependent: :destroy
  has_many :participants, through: :attendances
  belongs_to :event

  validates :name, presence: true
  validates :scheduled_at, uniqueness: true, presence: true
  default_scope { order(scheduled_at: :asc) }

  after_create :add_attendances

  def add_attendances
    event.participants.each do |participant|
      attendances.create(participant_id: participant.id, activity_id: self.id)
    end
  end
end
