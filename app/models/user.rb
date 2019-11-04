class User < ApplicationRecord

	after_create :welcome_send

	has_many :atttendances
	has_many :events, through: :attendances
    has_many :organisations, foreign_key: 'admin_id', class_name: "Event"


  def welcome_send
  	UserMailer.welcome_email(self).deliver_now	
  end

end
