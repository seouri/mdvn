class BibliomeJournal < ActiveRecord::Base
  belongs_to :bibliome
  belongs_to :journal
  has_many :author_journals
  has_many :journal_subjects
  has_many :journal_pubtypes
  
  validates_uniqueness_of :journal_id, :scope => [:bibliome_id, :year]

  scope :period, lambda {|range|
    where(:year => range).order("articles_count desc")
  }

  scope :bibliome, lambda {|bibliome|
    where(:bibliome_id => bibliome.id)
  }
end
