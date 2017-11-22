class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  after_create :welcome_send
  
  has_many :topics
  has_many :bookmarks

  private
 
  def welcome_send
    WelcomeMailer.welcome_send(self).deliver_now
  end
end
