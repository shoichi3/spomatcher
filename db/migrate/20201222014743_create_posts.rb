class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title,      null: false
      t.string :type,       null: false
      t.string :datetime,   null: false
      t.string :regular_date
      t.string :region,     null: false
      t.string :cost,       null: false
      t.text :content,      null: false
      t.text :flow,         null: false
      t.references :user,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
