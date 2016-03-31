class Servicer < ActiveRecord::Base

	has_many :servicer_assignments
	has_many :products, :through => :servicer_assignments

	validates :name, presence: true, 
					 uniqueness: true

	scope :sorted, lambda { order("servicers.name ASC") }

end
