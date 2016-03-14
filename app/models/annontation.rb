class Annontation < ActiveRecord::Base

	belongs_to :annotated, polymorphic: true

end