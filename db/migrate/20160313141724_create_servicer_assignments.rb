class CreateServicerAssignments < ActiveRecord::Migration
  def change
    create_table :servicer_assignments do |t|
      t.references :product
      t.references :servicer
      t.string :condition
      t.timestamps null: false
    end
    add_index :servicer_assignments, [:product_id, :servicer_id], :name => 'servicer_assignments_index'
  end
end