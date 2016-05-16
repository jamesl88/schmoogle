class Event < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_many :participants

  before_save :generate_slug

  def to_param
    self.slug
  end

  def generate_slug
    self.slug ||= [*('A'..'Z')].sample(8).join
  end
end
