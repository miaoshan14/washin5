class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :location
      t.integer :pictures_goal
      t.string :project_picture

      t.timestamps
    end
  end
end
