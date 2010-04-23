class BibliomePubtype < ActiveRecord::Base
  belongs_to :bibliome
  belongs_to :pubtype
  
  validates_uniqueness_of :pubtype_id, :scope => [:bibliome_id, :year]

  scope :period, lambda {|range|
    where(:year => range).order("articles_count desc")
  }

  scope :bibliome, lambda {|bibliome|
    where(:bibliome_id => bibliome.id)
  }
end
