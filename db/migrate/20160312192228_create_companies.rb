class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website_url
      t.timestamps null: false
    end
    add_index :companies, :name, unique: true	# unique index on company name
  end
end