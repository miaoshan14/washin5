class CreateFinancings < ActiveRecord::Migration[5.0]
  def change
    create_table :financings do |t|
      t.float :amount
      t.references :project, foreign_key: true
      t.references :partner, foreign_key: true

      t.timestamps
    end
  end
end
