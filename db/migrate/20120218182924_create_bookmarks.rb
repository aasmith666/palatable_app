class CreateBookmarks < ActiveRecord::Migration
  def self.up
    create_table :bookmarks do |t|
      t.string :url
      t.string :name
      t.date :date_saved

      t.timestamps
    end
	
	add_index :bookmarks, [:user_id, :created_at]
  end

  def self.down
    drop_table :bookmarks
  end
end
