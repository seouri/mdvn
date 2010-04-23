class BibliomeGene < ActiveRecord::Base
  belongs_to :bibliome
  belongs_to :genes
  
  validates_uniqueness_of :gene_id, :scope => [:bibliome_id, :year]

  scope :period, lambda {|range|
    where(:year => range).order("articles_count desc")
  }

  scope :bibliome, lambda {|bibliome|
    where(:bibliome_id => bibliome.id)
  }
end
