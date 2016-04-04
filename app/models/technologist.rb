class Technologist < ActiveRecord::Base

	has_many :technologist_assignments
	has_many :products, :through => :technologist_assignments
	has_many :notes, as: :annotatable

	validates :name, presence: true, 
					 uniqueness: true
					 
	scope :sorted, lambda { order("technologists.name ASC") }

end
