class CreateTechnologistAssignments < ActiveRecord::Migration
  def change
    create_table :technologist_assignments do |t|
      t.references :product
      t.references :technologist
      t.string :condition
      t.timestamps null: false
    end
    add_index :technologist_assignments, [:product_id, :technologist_id], :name => 'technologist_assignments_index'
  end
end
