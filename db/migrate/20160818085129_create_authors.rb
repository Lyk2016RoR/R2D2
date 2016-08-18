class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :firstName
      t.string :lastName
      t.string :description

      t.timestamps
    end
  end
end
