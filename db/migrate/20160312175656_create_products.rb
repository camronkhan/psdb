class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :company
      t.string :name
      t.string :image
      t.timestamps null: false
    end
    add_index :products, :company_id
  end
end
