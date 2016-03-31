class CreateServicers < ActiveRecord::Migration
  def change
    create_table :servicers do |t|
      t.string :name
      t.string :internal_phone
      t.string :external_phone
      t.string :address
      t.timestamps null: false
    end
    add_index :servicers, :name, unique: true	# unique index on servicer name
  end
end