class Event < ApplicationRecord

	has_many :attendances
	has_many :users , through: :attendances
	belongs_to :admin, class_name: "User"

	validates :start_date, presence: true 

	validates :duration, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

	validate :multiple_of_5
#le validate des méthodes est au singulier

	validates :title, presence: true, length: {minimum: 5, maximum: 140}

	validates :description, presence: true, length: {minimum: 20, maximum: 1000}

	validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000}

	validates :location, presence: true

	def multiple_of_5
      if (self.duration % 5) != 0
      self.errors[:base] << "Number must be divisible by 5!"
      end
	end

end
