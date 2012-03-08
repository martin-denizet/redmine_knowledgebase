class MigrateRatings < ActiveRecord::Migration
  def self.up
    migrate_ratings('Article','KbArticle')
  end

  def self.down
    migrate_ratings('KbArticle','Article')
  end

  def self.migrate_ratings(from,to)
    #Somehow the object Ratings does not exist at this point in the context
    #Using raw SQL:
    ActiveRecord::Base.connection.execute "UPDATE ratings SET rated_type='"+to+"' WHERE rated_type='"+from+"'"
  end

end

