class MigrateTaggings < ActiveRecord::Migration
  def self.up
    migrate_taggings('Article','KbArticle')
  end

  def self.down
    migrate_taggings('KbArticle','Article')
  end

  def self.migrate_taggings(from,to)
    KbTagging.transaction do
      taggings=KbTagging.find(:all,:conditions=>["taggable_type=?",from])
      taggings.each{|tagging|
        tagging.taggable_type=to
        tagging.save
      }
    end
  end

end

