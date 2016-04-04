class ServicerAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :servicer
	has_many :notes, as: :annotatable
					 
	#scope :sorted, lambda { order("servicer_assignments.servicer.name ASC") }

end
