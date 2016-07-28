class AddColumnReshareInAskWhies < ActiveRecord::Migration[5.0]
  def change
    add_column :ask_whies, :reshare, :string, array: true, default: []
  end
end