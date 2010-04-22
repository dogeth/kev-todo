class CreateTodoTags < ActiveRecord::Migration
  def self.up
    create_table :todo_tags do |t|
      t.integer :tag_id
      t.integer :todo_id

      t.timestamps
    end
    
    add_index :todo_tags, :tag_id
    add_index :todo_tags, :todo_id
  end

  def self.down
    remove_index :todo_tags, :todo_id
    remove_index :todo_tags, :tag_id
    mind
    drop_table :todo_tags
  end
end