class TechnologistAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :technologist
	has_many :notes, as: :annotatable, dependent: :destroy

	accepts_nested_attributes_for :technologist,
								  reject_if: :all_blank
	accepts_nested_attributes_for :notes, 
								  reject_if: :all_blank,
								  allow_destroy: true
		
	# Returns the condition of a single technologist assignment give the product and technologist IDs
	def self.condition(p_id, t_id)
		self.select(:condition)
			.where(product_id: p_id, technologist_id: t_id)
			.first
			.condition
	end
end
