class ServicerAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :servicer
	
	validates name:, presence: true, 
					 uniqueness: true
					 
	#scope :sorted, lambda { order("servicer_assignments.servicer.name ASC") }

end
