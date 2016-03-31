class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :company
      t.string :name
      t.string :image_url
      t.string :tags
      t.timestamps null: false
    end
    add_index :products, :company_id                          # foreign key index
    add_index :products, [:name, :company_id], unique: true   # unique index allowing exactly one product name per company
  end
end