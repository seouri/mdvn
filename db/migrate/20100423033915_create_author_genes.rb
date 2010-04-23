class CreateAuthorGenes < ActiveRecord::Migration
  def self.up
    create_table :author_genes do |t|
      t.integer :bibliome_id
      t.integer :author_id
      t.integer :gene_id
      t.string :year
      t.integer :first, :default => 0
      t.integer :last, :default => 0
      t.integer :middle, :default => 0
      t.integer :total, :default => 0
    end
    add_index :author_genes, [:bibliome_id, :author_id, :year, :gene_id], :name => 'index_author_genes_on_bibliome_id_author_id_year_gene_id'
    add_index :author_genes, [:bibliome_id, :gene_id, :year, :total], :name => 'index_author_genes_on_bibliome_id_gene_id_year_total'
    add_index :author_genes, [:bibliome_id, :author_id, :year, :total], :name => 'index_author_genes_on_bibliome_id_author_id_year_total'
  end

  def self.down
    drop_table :author_genes
  end
end
