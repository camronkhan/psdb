class TechnologistAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :technologist
	has_many :notes, as: :annotatable, dependent: :destroy

	accepts_nested_attributes_for :notes
	
	#scope :sorted, lambda { order("technologist_assignments.technologist.name ASC") }
	
end
