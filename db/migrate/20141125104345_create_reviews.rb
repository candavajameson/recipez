class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references  :recipe, index: true
      t.text :message
      t.integer :rating
      t.references :user, index: true

      t.timestamps
    end
  end
end
