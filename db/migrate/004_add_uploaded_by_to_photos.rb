class AddUploadedByToPhotos < ActiveRecord::Migration
  def self.up
    add_column :photos, :uploaded_by, :string
  end

  def self.down
    remove_column :photos, :uploaded_by
  end
end
