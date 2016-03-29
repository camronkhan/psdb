class Technologist < ActiveRecord::Base

	has_many :technologist_assignments
	has_many :products, :through => :technologist_assignments

	scope :sorted, lambda { order("technologists.name ASC") }

end
