class AddAttachmentPhotoToOnscrits < ActiveRecord::Migration
  def self.up
    change_table :onscrits do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :onscrits, :photo
  end
end
