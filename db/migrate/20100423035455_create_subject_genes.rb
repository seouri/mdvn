class CreateSubjectGenes < ActiveRecord::Migration
  def self.up
    create_table :subject_genes do |t|
      t.integer :bibliome_id
      t.integer :subject_id
      t.integer :gene_id
      t.string :year
      t.integer :direct, :default => 0
      t.integer :descendant, :default => 0
      t.integer :total, :default => 0
    end
    add_index :subject_genes, [:bibliome_id, :gene_id, :year, :subject_id], :name => 'index_subject_genes_on_bibliome_gene_year_subject'
    add_index :subject_genes, [:bibliome_id, :subject_id, :year, :direct], :name => 'index_subject_genes_on_bibliome_id_subject_id_year_direct'
    add_index :subject_genes, [:bibliome_id, :gene_id, :year, :direct], :name => 'index_subject_genes_on_bibliome_id_gene_id_year_direct'
  end

  def self.down
    drop_table :subject_genes
  end
end
