class Event < ApplicationRecord


  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
  validate :is_multiple_of_5?
  validate :event_must_be_in_the_future
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: {only_integer: true}
 
  validates :title, presence: true, length:  {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, inclusion: {in: 1..1000}
  validates :location, presence: true

  def end_date
    start_date + duration
  end

  


  def is_multiple_of_5?
    unless self[:duration] % 5 == 0 
      false
    end
  end

  def event_must_be_in_the_future 
    errors.add(:start_date, "start date must be in the future") unless 
    start_date > Time.now 
  end

end
