class Event < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_many :participants

  before_save :generate_slug

  accepts_nested_attributes_for :activities, :participants

  def to_param
    self.slug
  end

  def generate_slug
    self.slug ||= [*('A'..'Z')].sample(8).join
  end
end
