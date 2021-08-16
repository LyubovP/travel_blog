class RenameBlogs < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :blogs, :posts
  end

  def self.down
    rename_table :posts, :blogs
  end
end
