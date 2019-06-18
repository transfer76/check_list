class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title
      t.string :description
      t.string :project_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
