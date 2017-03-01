class AddStatusToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :current, :boolean
    add_column :projects, :done, :boolean
    add_column :projects, :future, :boolean
    add_column :projects, :impact, :integer
  end
end
