class ServicerAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :servicer
	has_many :notes, as: :annotatable, dependent: :destroy

	accepts_nested_attributes_for :notes
					 
	#scope :sorted, lambda { order("servicer_assignments.servicer.name ASC") }

	# Returns the condition of a single servicer assignment give the product and servicer IDs
	def self.condition(p_id, s_id)
		self.select(:condition)
			.where(product_id: p_id, servicer_id: s_id)
			.first
			.condition
	end
end
