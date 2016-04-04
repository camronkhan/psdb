class ServicerAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :servicer
	has_many :notes, as: :annotatable, dependent: :destroy

	accepts_nested_attributes_for :notes
					 
	#scope :sorted, lambda { order("servicer_assignments.servicer.name ASC") }

end
