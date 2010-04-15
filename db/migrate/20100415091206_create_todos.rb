class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :title
      t.string :user
      t.boolean :complete

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
