class CreateInitialDb < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username

      t.timestamps
    end
    add_index :users, :username, unique: true

    create_table :forms do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :form_questions do |t|
      t.string :title, null: false
      t.text :description
      t.references :form, foreign_key: true

      t.timestamps
    end

    create_table :check_lists do |t|
      t.string :project_uid
      t.datetime :published_at
      t.boolean :published, default: false
      t.references :form, foreign_key: true
      t.references :user, foreign_key: true


      t.timestamps
    end

    create_table :answers do |t|
      # 0 = Absent, 1 = Yes, 2 = No, 3 = N/A
      t.integer :response, default: 0
      t.text :comment
      t.references :form_question, foreign_key: true
      t.references :user, foreign_key: true
      t.references :check_list, foreign_key: true

      t.timestamps
    end

  end
end
