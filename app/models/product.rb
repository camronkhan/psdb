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

	# Virtual Attributes (utilized for form autocompletion)
	def company_name			# Getter method - return nil if name is not found
		company.try(:name)
	end
	def company_name=(name)		# Setter method - only set if name is present
		self.company = Company.find_by(name: name) if name.present?
	end

	# Scopes
	scope :ascending, 		-> { order("products.name ASC") }
	scope :descending,		-> { order("products.name DESC") }
	scope :fts_ascending,	-> { reorder("products.name ASC") }
	scope :fts_descending,	-> { reorder("products.name DESC") }

	# PostgreSQL full text search
	include PgSearch
	pg_search_scope :full_text_search,
					against: :name,
					#associated_against: {
					#	company: :name,
					#	tags: :name
					#},
					using: {
						#tsearch: {
							#prefix: true,			# search for partial words
							#dictionary: 'english',	# allows for stemming
							#any_word: true			# returns all hits containing any word in search terms
						#},
						trigram: {
							threshold: 0.2			# higher threshold --> more strict --> fewer results (default==0.3)
						}#,
						#dmetaphone: {}
					},
					ranked_by: ":trigram"

	pg_search_scope :search_by_product,
					against: :name,
					using: {
						trigram: {
							threshold: 0.2			# higher threshold --> more strict --> fewer results (default==0.3)
						}
					},
					ranked_by: ":trigram"			# ranking algorithm
	pg_search_scope :search_by_company,
					associated_against: {
						company: :name
					},
					using: {
						tsearch: {
							prefix: true,			# search for partial words
							dictionary: 'english',	# allows for stemming
							any_word: true			# returns all hits containing any word in search terms
						}
					}
	pg_search_scope :search_by_tag,
					associated_against: {
						tags: :name
					},
					using: {
						tsearch: {
							prefix: true,			# search for partial words
							dictionary: 'english',	# allows for stemming
							any_word: true			# returns all hits containing any word in search terms
						}
					}
	pg_search_scope :search_by_product_company,
					against: :name,
					associated_against: {
						company: :name,
					},
					using: {
						tsearch: {
							prefix: true,			# search for partial words
							dictionary: 'english',	# allows for stemming
							any_word: true			# returns all hits containing any word in search terms
						},
						trigram: {
							only: [:name],			# only use trigram from product name
							threshold: 0.2			# higher threshold --> more strict --> fewer results (default==0.3)
						}
					},
					ranked_by: "(0.75 * :trigram) + (0.25 * :tsearch)"		# ranking algorithm
	pg_search_scope :search_by_product_tag,
					against: :name,
					associated_against: {
						tags: :name,
					},
					using: {
						tsearch: {
							prefix: true,			# search for partial words
							dictionary: 'english',	# allows for stemming
							any_word: true			# returns all hits containing any word in search terms
						},
						trigram: {
							only: [:name],			# only use trigram from product name
							threshold: 0.2			# higher threshold --> more strict --> fewer results (default==0.3)
						}
					},
					ranked_by: "(0.75 * :trigram) + (0.25 * :tsearch)"		# ranking algorithm
	pg_search_scope :search_by_company_tag,
					associated_against: {
						company: :name,
						tags: :name,
					},
					using: {
						tsearch: {
							prefix: true,			# search for partial words
							dictionary: 'english',	# allows for stemming
							any_word: true			# returns all hits containing any word in search terms
						},
					}
	pg_search_scope :search_by_product_company_tag,
					against: :name,
					associated_against: {
						company: :name,
						tags: :name
					},
					using: {
						tsearch: {
							prefix: true,			# search for partial words
							dictionary: 'english',	# allows for stemming
							any_word: true			# returns all hits containing any word in search terms
						},
						trigram: {
							only: [:name],			# only use trigram from product name
							threshold: 0.2			# higher threshold --> more strict --> fewer results (default==0.3)
						}
					},
					ranked_by: "(0.75 * :trigram) + (0.25 * :tsearch)"		# ranking algorithm
end