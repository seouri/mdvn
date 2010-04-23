class Bibliome < ActiveRecord::Base
  has_many :bibliome_articles
  has_many :articles, :through => :bibliome_articles, :order => "#{BibliomeArticle.table_name}.pubdate desc"
  has_many :journals, :class_name => "BibliomeJournal", :include => :journal
  has_many :authors, :class_name => "BibliomeAuthor", :include => :author
  has_many :subjects, :class_name => "BibliomeSubject", :include => :subject
  #has_many :genes, :class_name => "BibliomeGene", :include => :gene
  has_many :pubtypes, :class_name => "BibliomePubtype", :include => :pubtype
  has_many :author_journals
  has_many :coauthorships
  has_many :author_subjects
  has_many :author_genes
  has_many :author_pubtypes
  has_many :journal_subjects
  has_many :journal_genes
  has_many :journal_pubtypes
  has_many :cosubjects
  has_many :subject_genes
  
  validates_uniqueness_of :name
  
  scope :built, where(:built => true)
  scope :recent, lambda {|limit|
    built.order("built_at desc").limit(limit)
  }
  scope :popular, lambda {|limit|
    built.order("hits desc").limit(limit)
  }
  scope :enqueued, where(:built => false, :articles_count => 0)
  scope :inprocess, :conditions => ["built = ? AND all_articles_count > 0", false]
  scope :last_built, built.order("built_at desc").limit(1)

  def status
    if built?
      "finished importing"
    else
      "imported"
    end
  end

  def hit!
    if built?
      self.delete_at = 2.weeks.from_now
      self.increment! :hits
    end
  end

  def processing_time
    to_time = built_at || Time.now
    from_time = started_at || Time.now
    (to_time - from_time).round
  end

  def build_speed
    (all_articles_count.to_f / processing_time.to_f * 60).round.to_s + " articles/min"
  end

  def start_year
    BibliomeArticle.minimum('pubdate', :conditions => ["bibliome_id = ?", id]).year
  end

  def end_year
    BibliomeArticle.maximum('pubdate', :conditions => ["bibliome_id = ?", id]).year
  end
end
