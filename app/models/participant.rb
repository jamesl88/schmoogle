class Participant < ActiveRecord::Base
  belongs_to :event
  has_many :attendances, dependent: :destroy
  has_many :activities, through: :attendances

  after_create :add_attendances

  def add_attendances
    event.activities.each do |activity|
      attendances.create(activity_id: activity.id, participant_id: self.id)
    end
  end
end
