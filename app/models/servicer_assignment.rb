class ServicerAssignment < ActiveRecord::Base

	belongs_to :product
	belongs_to :servicer
	has_many :notes, as: :annotatable, dependent: :destroy

	accepts_nested_attributes_for :servicer,
			   					  reject_if: :all_blank
	accepts_nested_attributes_for :notes
	
	# Returns the condition of a single servicer assignment give the product and servicer IDs
	def self.condition(p_id, s_id)
		self.select(:condition)
			.where(product_id: p_id, servicer_id: s_id)
			.first
			.condition
	end
end
