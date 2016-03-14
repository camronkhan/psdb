class CreateAnnontations < ActiveRecord::Migration
  def change
    create_table :annontations do |t|
      t.references :annotated, polymorphic: true, index: true
      t.string :note
      t.timestamps null: false
    end
    add_index :annontations, [:annotated_id, :annotated_type]
  end
end
