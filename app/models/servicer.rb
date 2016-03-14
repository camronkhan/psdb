class Servicer < ActiveRecord::Base

	has_many :servicer_assignments
	has_many :products, :through => :servicer_assignments
	has_many :annotations, as: :annotated

	scope :sorted, lambda { order("servicers.name ASC") }

end
