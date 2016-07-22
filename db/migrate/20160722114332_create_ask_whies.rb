class CreateAskWhies < ActiveRecord::Migration[5.0]
  def change
    create_table :ask_whies do |t|

      t.text :question
      t.integer :user_id
      t.timestamps
    end
  end
end
