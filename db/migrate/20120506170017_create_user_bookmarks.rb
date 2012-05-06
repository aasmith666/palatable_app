class CreateUserBookmarks < ActiveRecord::Migration
  def self.up
    create_table :user_bookmarks do |t|
      t.integer :user_id
      t.integer :bookmark_id
      t.string :bookmark_name

      t.timestamps
    end
	
	add_index :user_bookmarks, :user_id
    add_index :user_bookmarks, :bookmark_id
    add_index :user_bookmarks, [:user_id, :bookmark_id], :unique => true
  end

  def self.down
    drop_table :user_bookmarks
  end
end
