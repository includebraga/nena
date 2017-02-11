class AddAttachmentAvatarToLocations < ActiveRecord::Migration
  def self.up
    change_table :locations do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :locations, :avatar
  end
end
