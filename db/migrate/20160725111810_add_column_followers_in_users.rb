class AddColumnFollowersInUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :followers, :string, array: true, default: []
    add_column :users, :following, :string, array: true, default: []
  end
end
