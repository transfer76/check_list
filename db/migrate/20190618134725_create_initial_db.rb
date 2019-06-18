class CreateInitialDb < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
    
      t.timestamps
    end
    add_index :users, :username, unique: true
    
    create_table :forms do |t|
      t.string :title
      t.references :user, foreign_key: true
      
      t.timestamps
    end

    create_table :check_lists do |t|
      t.string :title
      t.string :description
      t.string :project_uid
      t.references :form, foreign_key: true
      t.references :user, foreign_key: true
      
  
      t.timestamps
    end

    create_table :questions do |t|
      t.string :title
      t.string :description
      t.string :answer
      t.references :check_list, foreign_key: true
  
      t.timestamps
    end
  end
end
