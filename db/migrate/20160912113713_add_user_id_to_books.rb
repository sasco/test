class AddUserIdToBooks < ActiveRecord::Migration
  def change
    add_reference  :books, :user, foreign_key:true
  end
end
