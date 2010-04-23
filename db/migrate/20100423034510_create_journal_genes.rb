class CreateJournalGenes < ActiveRecord::Migration
  def self.up
    create_table :journal_genes do |t|
      t.integer :bibliome_id
      t.integer :journal_id
      t.integer :gene_id
      t.string :year
      t.integer :total, :default => 0
    end
    add_index :journal_genes, [:bibliome_id, :journal_id, :year, :gene_id], :name => 'index_journal_genes_on_bibliome_journal_year_gene'
    add_index :journal_genes, [:bibliome_id, :gene_id, :year, :total], :name => 'index_journal_genes_on_bibliome_id_gene_id_year_total'
    add_index :journal_genes, [:bibliome_id, :journal_id, :year, :total], :name => 'index_journal_genes_on_bibliome_id_journal_id_year_total'
  end

  def self.down
    drop_table :journal_genes
  end
end
