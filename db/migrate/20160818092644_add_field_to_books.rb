class AddFieldToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :author, foreign_key: true
    add_reference :books, :category, foreign_key: true
    add_reference :books, :user, foreign_key: true
    add_reference :books, :status, foreign_key: true
  end
end
