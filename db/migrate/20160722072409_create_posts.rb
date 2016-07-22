class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.text :content
      t.attachment :image
      t.attachment :video
      t.integer :user_id
      t.integer :ask_why_id
      t.timestamps
    end
  end
end
