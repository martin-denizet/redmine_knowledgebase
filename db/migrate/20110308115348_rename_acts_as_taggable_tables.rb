class RenameActsAsTaggableTables < ActiveRecord::Migration
  def self.up
    rename_table :tags, :kb_tags
    rename_table :taggings, :kb_taggings
  end

  def self.down
    rename_table :kb_tags, :tags
    rename_table :kb_taggings, :taggings
  end
end

