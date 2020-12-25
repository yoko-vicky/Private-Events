class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendances, foreign_key: :attended_event, dependent: :destroy
  has_many :attendees, through: :event_attendances, dependent: :destroy

  scope :upcoming, -> { where('date > ?', Time.now) }
  scope :past, -> { where('date < ?', Time.now) }
  validates :title, :date, presence: true
end
