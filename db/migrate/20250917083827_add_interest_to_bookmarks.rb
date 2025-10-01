class AddInterestToBookmarks < ActiveRecord::Migration[8.0]
  def change
    add_column :bookmarks, :interest, :string
  end
end
