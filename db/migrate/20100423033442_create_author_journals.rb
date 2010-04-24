class CreateAuthorJournals < ActiveRecord::Migration
  def self.up
    create_table :author_journals do |t|
      t.integer :bibliome_id
      t.integer :author_id
      t.integer :journal_id
      t.integer :all_articles_count,  :default => 0,  :limit => 3
      t.integer :one_articles_count,  :default => 0,  :limit => 3
      t.integer :five_articles_count, :default => 0,  :limit => 3
      t.integer :ten_articles_count,  :default => 0,  :limit => 3
      t.integer :start_year,          :default => 0,  :limit => 2
      t.integer :end_year,            :default => 0,  :limit => 2
      t.text    :articles_counts
    end
    add_index :author_journals, [:bibliome_id, :journal_id, :all_articles_count], :name => 'index_author_journals_on_bibliome_journal_all_articles_count'
    add_index :author_journals, [:bibliome_id, :journal_id, :one_articles_count], :name => 'index_author_journals_on_bibliome_journal_one_articles_count'
    add_index :author_journals, [:bibliome_id, :journal_id, :five_articles_count], :name => 'index_author_journals_on_bibliome_journal_five_articles_count'
    add_index :author_journals, [:bibliome_id, :journal_id, :ten_articles_count], :name => 'index_author_journals_on_bibliome_journal_ten_articles_count'
    add_index :author_journals, [:bibliome_id, :author_id, :all_articles_count], :name => 'index_author_journals_on_bibliome_author_all_articles_count'
    add_index :author_journals, [:bibliome_id, :author_id, :one_articles_count], :name => 'index_author_journals_on_bibliome_author_one_articles_count'
    add_index :author_journals, [:bibliome_id, :author_id, :five_articles_count], :name => 'index_author_journals_on_bibliome_author_five_articles_count'
    add_index :author_journals, [:bibliome_id, :author_id, :ten_articles_count], :name => 'index_author_journals_on_bibliome_author_ten_articles_count'
  end

  def self.down
    drop_table :author_journals
  end
end
