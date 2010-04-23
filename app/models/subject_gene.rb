class SubjectGene < ActiveRecord::Base
  belongs_to :bibliome
  belongs_to :subject
  belongs_to :gene
end
