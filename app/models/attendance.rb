class Attendance < ApplicationRecord
  after_create :welcome_send

  belongs_to :user
  belongs_to :event

  def welcome_send
    EventMailer.welcome_event(Event.find(event_id)).deliver_now
  end

end
