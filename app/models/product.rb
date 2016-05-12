class Product < ActiveRecord::Base

	belongs_to :company
	has_many :technologist_assignments
	has_many :technologists, through: :technologist_assignments
	has_many :servicer_assignments
	has_many :servicers, through: :servicer_assignments
	has_many :notes, as: :annotatable, dependent: :destroy

	# Alias for acts_as_taggable_on :tags
	acts_as_taggable

	# Nested attributes
	accepts_nested_attributes_for :technologists, 
								  reject_if: :all_blank
	accepts_nested_attributes_for :technologist_assignments, 
								  reject_if: :all_blank,
								  allow_destroy: true
	accepts_nested_attributes_for :servicers, 
								  reject_if: :all_blank
	accepts_nested_attributes_for :servicer_assignments, 
								  reject_if: :all_blank,
								  allow_destroy: true
	accepts_nested_attributes_for :notes,
								  reject_if: :all_blank,
								  allow_destroy: true

	# Validations
	validates :name, presence: true,
					 uniqueness: { scope: :company_id,
					 			   message: "can appear only once for each company"}
	validates :company, presence: true

	# PostgreSQL full text search
	include PgSearch
	pg_search_scope :full_text_search,
					against: :name,
					#associated_against: {
					#	company: :name,
					#	tags: :name
					#},
					using: {
						tsearch: {
							prefix: true,			# search for partial words
							dictionary: 'english',	# allows for stemming
							tsvector_column: 'tsvector_content_tsearch',
							any_word: true			# returns all hits containing any word in search terms
						}#,
						#trigram: {
						#	threshold: 0.2 			# higher threshold --> more strict --> fewer results (default==0.3)
						#},
						#dmetaphone: {}
					}#,
					#ranked_by: ":dmetaphone"

	# Define company_name virtual attribute utilized for form autocompletion
	# Getter method - return nil if name is not found
	def company_name
		company.try(:name)
	end
	# Setter method - only set if name is present
	def company_name=(name)
		self.company = Company.find_by(name: name) if name.present?
	end
end