class AddColumnLikeDislikeInAskWhies < ActiveRecord::Migration[5.0]
  def change
    add_column :ask_whies, :likes, :string, array: true, default: []
    add_column :ask_whies, :dislikes, :string, array: true, default: []
    add_column :ask_whies, :super_likes, :string, array: true, default: []
  end
end