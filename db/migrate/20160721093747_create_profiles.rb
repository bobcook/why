class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|

      t.string :first_name
      t.string :last_name
      t.text :bio
      t.bigint :contact
      t.attachment :image
      t.string :city
      t.text :interests
      t.integer :user_id
      t.timestamps
    end
  end
end
