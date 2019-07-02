class AddPublishedToForm < ActiveRecord::Migration[5.2]
  def change
    add_column :forms, :published_at, :datetime
    add_column :forms, :published, :boolean, default: false
  end
end
