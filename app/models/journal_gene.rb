class JournalGene < ActiveRecord::Base
  belongs_to :bibliome
  belongs_to :journal
  belongs_to :gene
end
