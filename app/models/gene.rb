class Gene < ActiveRecord::Base
  has_many :bibliome_genes, :order => "year"
  has_many :bibliomes, :through => :bibliome_genes
  belongs_to :taxonomy
  has_many :published_genes
  has_many :journal_genes
  has_many :author_genes
  has_many :subject_genes
end
