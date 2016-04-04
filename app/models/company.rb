class Company < ActiveRecord::Base

	has_many :products
	has_many :notes, as: :annotatable

	validates :name, presence: true, 
					 uniqueness: true

	scope :sorted, lambda { order("companies.name ASC") }
	scope :reverse_sorted, lambda { order("companies.name ASC").reverse_order }

end