class CreateAuthor < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.references :book
    end
  end
end
