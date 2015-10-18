class User < ActiveRecord::Base
  has_many :activities, through: :participants
  has_many :participants

  def add_activities
    activities = Activity.all.reject { |activity| self.activities.pluck(:name).include?(activity.name) }

    activities.each do |activity|
      return if participants.pluck(:activity_id).include?(activity.id)
      participant = self.participants.new(activity: activity)
      participant.save
    end
  end
end
