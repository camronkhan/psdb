class TechnologistAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :technologist
	
	#scope :sorted, lambda { order("technologist_assignments.technologist.name ASC") }
	
end
