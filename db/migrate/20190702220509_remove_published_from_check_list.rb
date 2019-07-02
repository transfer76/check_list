class RemovePublishedFromCheckList < ActiveRecord::Migration[5.2]
  def change
    remove_column :check_lists, :published, :boolean
  end
end
