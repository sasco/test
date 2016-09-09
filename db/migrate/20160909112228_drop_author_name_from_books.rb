class DropAuthorNameFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :author_name
  end
end
