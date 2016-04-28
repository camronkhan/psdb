class Technologist < ActiveRecord::Base

	has_many :technologist_assignments
	has_many :products, :through => :technologist_assignments
	has_many :notes, as: :annotatable, dependent: :destroy

	# Nested attributes
	accepts_nested_attributes_for :notes, 
								  reject_if: lambda { |a| a[:data].blank? },
								  allow_destroy: true

	# Validations
	validates :name, presence: true, 
					 uniqueness: true
					 
	# PostgreSQL full text search
	include PgSearch
	pg_search_scope :full_text_search,
					:against => :name,
					:using => {
						:tsearch => {
							:prefix => true,			# search for partial words
							:any_word => true			# returns all hits containing any word in search terms
						},
						:trigram => {
							:threshold => 0.2 			# higher threshold --> more strict --> fewer results (default==0.3)
						}
					}

end
