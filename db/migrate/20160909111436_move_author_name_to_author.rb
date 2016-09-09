class MoveAuthorNameToAuthor < ActiveRecord::Migration
  def change
    rename_column :books, :author, :author_name
    Book.reset_column_information
    Book.all.each do |book|
      name = book.author_name
      Author.create!({book: book, name: name})
    end
  end
end
