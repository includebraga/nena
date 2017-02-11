class AddAttachmentHeroToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :hero
    end
  end

  def self.down
    remove_attachment :projects, :hero
  end
end
