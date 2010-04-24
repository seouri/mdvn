class CreateBibliomeAuthors < ActiveRecord::Migration
  def self.up
    create_table :bibliome_authors do |t|
      t.integer :bibliome_id
      t.integer :author_id
      t.integer :all_articles_count,          :default => 0,  :limit => 3
      t.integer :one_articles_count,          :default => 0,  :limit => 3
      t.integer :five_articles_count,         :default => 0,  :limit => 3
      t.integer :ten_articles_count,          :default => 0,  :limit => 3
      t.integer :all_first_articles_count,    :default => 0,  :limit => 3
      t.integer :one_first_articles_count,    :default => 0,  :limit => 3
      t.integer :five_first_articles_count,   :default => 0,  :limit => 3
      t.integer :ten_first_articles_count,    :default => 0,  :limit => 3
      t.integer :all_last_articles_count,     :default => 0,  :limit => 3
      t.integer :one_last_articles_count,     :default => 0,  :limit => 3
      t.integer :five_last_articles_count,    :default => 0,  :limit => 3
      t.integer :ten_last_articles_count,     :default => 0,  :limit => 3
      t.integer :all_middle_articles_count,   :default => 0,  :limit => 3
      t.integer :one_middle_articles_count,   :default => 0,  :limit => 3
      t.integer :five_middle_articles_count,  :default => 0,  :limit => 3
      t.integer :ten_middle_articles_count,   :default => 0,  :limit => 3
      t.integer :start_year,                  :default => 0,  :limit => 2
      t.integer :end_year,                    :default => 0,  :limit => 2
      t.text    :articles_counts
      t.text    :first_articles_counts
      t.text    :last_articles_counts
      t.text    :middle_articles_counts
    end
    add_index :bibliome_authors, [:bibliome_id, :author_id, :all_articles_count], :name => 'index_bibliome_authors_on_bibliome_author_articles_count'
    add_index :bibliome_authors, [:bibliome_id, :author_id, :one_articles_count], :name => 'index_bibliome_authors_on_bibliome_author_one_articles_count'
    add_index :bibliome_authors, [:bibliome_id, :author_id, :five_articles_count], :name => 'index_bibliome_authors_on_bibliome_author_five_articles_count'
    add_index :bibliome_authors, [:bibliome_id, :author_id, :ten_articles_count], :name => 'index_bibliome_authors_on_bibliome_author_ten_articles_count'
  end

  def self.down
    drop_table :bibliome_authors
  end
end
