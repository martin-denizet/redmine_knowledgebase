class KbTagging < ActiveRecord::Base #:nodoc:
  belongs_to :tag, :class_name => 'KbTag'
  belongs_to :taggable, :polymorphic => true
  
  def after_destroy
    if KbTag.destroy_unused
      if tag.taggings.count.zero?
        tag.destroy
      end
    end
  end
end
