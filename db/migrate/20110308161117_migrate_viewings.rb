class MigrateViewings < ActiveRecord::Migration
  def self.up
    migrate_viewings('Article','KbArticle')
  end

  def self.down
    migrate_viewings('KbArticle','Article')
  end

  def self.migrate_viewings(from,to)
    #Somehow the object Viewing does not exist at this point in the context
    #Using raw SQL:
    ActiveRecord::Base.connection.execute "UPDATE viewings SET viewed_type='"+to+"' WHERE viewed_type='"+from+"'"
  end

end

