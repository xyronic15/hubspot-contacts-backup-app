class AddArchivedToContact < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :archived, :boolean
  end
end
