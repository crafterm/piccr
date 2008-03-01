class AddClickCountToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :click_count, :integer, :default => 0
  end

  def self.down
    remove_column :photos, :click_count
  end
end
