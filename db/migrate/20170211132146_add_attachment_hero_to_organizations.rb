class AddAttachmentHeroToOrganizations < ActiveRecord::Migration
  def self.up
    change_table :organizations do |t|
      t.attachment :hero
    end
  end

  def self.down
    remove_attachment :organizations, :hero
  end
end
