class Company < ActiveRecord::Base

	has_many :products

	scope :sorted, lambda { order("companies.name ASC") }
	scope :reverse_sorted, lambda { order("companies.name ASC").reverse_order }

end