class Product < ActiveRecord::Base

	belongs_to :company
	has_many :technologist_assignments
	has_many :technologists, :through => :technologist_assignments
	has_many :annotations, as: :annotated

	scope :sorted, lambda { order("products.name ASC") }
	
end
