class Participant < ActiveRecord::Base
  belongs_to :event
  has_many :attendances, dependent: :destroy
  has_many :activities, through: :attendances

  validates :name, presence: true

  after_create :add_attendances

  def add_attendances
    return if event.activities.empty?
    event.activities.each do |activity|
      attendances.create(activity_id: activity.id, participant_id: self.id)
    end
  end
end
