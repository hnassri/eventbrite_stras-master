class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # after_create :welcome_send
   after_update :redirect
  has_many :events
  has_many :attendances
  has_many :events, through: :attendances
  validates :email, presence: true, uniqueness: true
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def redirect
    user_path(current_user.id)
  end

end
