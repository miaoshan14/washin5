class AddAllowToUploadToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :allow_to_upload, :boolean, default: false, null: false
  end
end
