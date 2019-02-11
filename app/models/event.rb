class Event < ApplicationRecord


  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances

  validate :event_must_be_in_the_future
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: {only_integer: true},if: :is_multiple_of_5?
  validates :title, presence: true, length:  {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, inclusion: {in: 1..1000}
  validates :location, presence: true

  

  


  def is_multiple_of_5?
    duration % 5 == 0 ? true : false 
  end

  def event_must_be_in_the_future 
    errors.add(:start_date, "start date must be in the future") unless 
    start_date > Time.now 
  end

end
