class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :attended_event
  has_many :attendees, through: :event_attendances

  scope :upcoming, -> { where('date > ?', Time.now) }
  scope :past, -> { where('date < ?', Time.now) }
end
