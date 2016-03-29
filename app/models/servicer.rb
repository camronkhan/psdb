class Servicer < ActiveRecord::Base

	has_many :servicer_assignments
	has_many :products, :through => :servicer_assignments

	scope :sorted, lambda { order("servicers.name ASC") }

end
