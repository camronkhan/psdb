class CreateTechnologists < ActiveRecord::Migration
  def change
    create_table :technologists do |t|
      t.string :name
      t.string :internal_phone
      t.string :external_phone
      t.string :hours
      t.string :escalation
      t.timestamps null: false
    end
    add_index :technologists, :name, unique: true   # unique index on technologist name
  end
end
