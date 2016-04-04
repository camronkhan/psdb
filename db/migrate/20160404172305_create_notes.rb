class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.references :annotatable, polymorphic: true, index: true	#creates annotatable_id:integer and annotatable_type:string
      	t.text :data
      	t.integer :position
      	t.timestamps null: false
    end
  end
end
