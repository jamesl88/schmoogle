class Participant < ActiveRecord::Base
  belongs_to :event
  has_many :attendances
  has_many :activities, through: :attendances
end
