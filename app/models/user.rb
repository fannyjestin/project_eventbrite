class User < ApplicationRecord

	after_create :welcome_send
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  
	has_many :atttendances
	has_many :events, through: :attendances
    has_many :organisations, foreign_key: 'admin_id', class_name: "Event"


  def welcome_send
  	UserMailer.welcome_email(self).deliver_now	
  end

end
