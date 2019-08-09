class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.text :text
      t.date :DateOfCreation
      t.boolean :check
      t.text :owner

      t.timestamps
    end
  end
end
