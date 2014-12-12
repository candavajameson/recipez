class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :desc
      t.text :ingredients
      t.text :procedures
      t.integer :category_id

      t.timestamps
    end
  end
end
