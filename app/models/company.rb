class Company < ActiveRecord::Base

	has_many :products
	has_many :notes, as: :annotatable, dependent: :destroy

	accepts_nested_attributes_for :notes, 
								  reject_if: lambda { |a| a[:data].blank? },
								  allow_destroy: true

	validates :name, presence: true, 
					 uniqueness: true

	scope :sorted, lambda { order("companies.name ASC") }
	scope :reverse_sorted, lambda { order("companies.name ASC").reverse_order }

end