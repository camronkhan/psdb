class Company < ActiveRecord::Base

	has_many :products
	has_many :annotations, as: :annotated

	scope :sorted, lambda { order("companies.name ASC") }
	
end
