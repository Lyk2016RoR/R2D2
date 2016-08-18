class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :pushlished
      t.integer :pages
      t.string :description
      t.string :publisher

      t.timestamps
    end
  end
end
