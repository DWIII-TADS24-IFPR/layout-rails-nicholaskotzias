class User < ApplicationRecord
  has_many :posts
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email

  private
  
  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
