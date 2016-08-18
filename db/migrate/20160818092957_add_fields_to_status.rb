class AddFieldsToStatus < ActiveRecord::Migration[5.0]
  def change
    add_reference :statuses, :book, foreign_key: true
    add_reference :statuses, :user, foreign_key: true
  end
end
