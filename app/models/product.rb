class Product < ActiveRecord::Base

	include PgSearch

	belongs_to :company
	has_many :technologist_assignments
	has_many :technologists, :through => :technologist_assignments

	pg_search_scope :full_text_search,
					:against => {
						:name => 'A',					# product name --> highest weighting in search
						:tags => 'B'					# tags --> second highest weighting in search
					},
					:associated_against => {
						:company => :name
					},
					:using => {
						:tsearch => {
							:prefix => true,			# search for partial words
							:dictionary => 'english',	# allows for stemming
							:any_word => true			# returns all hits containing any word in search terms
						},
						:trigram => {
							:threshold => 0.2 			# higher threshold --> more strict --> fewer results
						},
						:dmetaphone => {}
					},
					:ranked_by => '(:dmetaphone / 2) + (:trigram * 2)'

	#scope :search, -> (value) { where("products.name LIKE ?", "%#{value}%") }
	#scope :sorted, -> { joins(:company).order("products.name ASC", "companies.name ASC") }
	#scope :reverse_sorted, -> { joins(:company).order("products.name DESC", "companies.name ASC") }
	#scope :company_sorted, -> { joins(:company).order("companies.name ASC", "products.name ASC") }
	#scope :company_reverse_sorted, -> { joins(:company).order("companies.name DESC", "products.name ASC") }
	
end
