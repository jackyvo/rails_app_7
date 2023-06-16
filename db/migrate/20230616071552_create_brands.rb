class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :country
      t.string :founder_name
      t.datetime :founded_date

      t.timestamps
    end
  end
end
