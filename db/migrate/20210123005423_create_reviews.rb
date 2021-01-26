class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :reviewer, foreign_key: {to_table: :users} , null: false
      t.references  :reviewee, foreign_key: {to_table: :users} , null: false
      t.string :content
      t.float :score
      t.timestamps
    end
  end
end
