class AddColumnLikesInPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :likes, :string, array: true, default: []
  end
end
