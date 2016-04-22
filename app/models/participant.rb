class Participant < ActiveRecord::Base
  has_many :activities, through: :rsvp
end
