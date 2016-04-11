class TechnologistAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :technologist
	has_many :notes, as: :annotatable, dependent: :destroy

	accepts_nested_attributes_for :notes
	
	#scope :sorted, lambda { order("technologist_assignments.technologist.name ASC") }
	
	# Returns the condition of a single technologist assignment give the product and technologist IDs
	def self.condition(p_id, t_id)
		self.select(:condition)
			.where(product_id: p_id, technologist_id: t_id)
			.first
			.condition
	end
end
