class RenameRegionColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :region, :address
  end
end
