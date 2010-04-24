class CreateAuthorPubtypes < ActiveRecord::Migration
  def self.up
    create_table :author_pubtypes do |t|
      t.integer :bibliome_id
      t.integer :author_id
      t.integer :pubtype_id
      t.integer :all_articles_count,  :default => 0,  :limit => 3
      t.integer :one_articles_count,  :default => 0,  :limit => 3
      t.integer :five_articles_count, :default => 0,  :limit => 3
      t.integer :ten_articles_count,  :default => 0,  :limit => 3
      t.integer :start_year,          :default => 0,  :limit => 2
      t.integer :end_year,            :default => 0,  :limit => 2
      t.text    :articles_counts
    end
    add_index :author_pubtypes, [:bibliome_id, :pubtype_id, :all_articles_count], :name => 'index_author_pubtypes_on_bibliome_pubtype_all_articles_count'
    add_index :author_pubtypes, [:bibliome_id, :pubtype_id, :one_articles_count], :name => 'index_author_pubtypes_on_bibliome_pubtype_one_articles_count'
    add_index :author_pubtypes, [:bibliome_id, :pubtype_id, :five_articles_count], :name => 'index_author_pubtypes_on_bibliome_pubtype_five_articles_count'
    add_index :author_pubtypes, [:bibliome_id, :pubtype_id, :ten_articles_count], :name => 'index_author_pubtypes_on_bibliome_pubtype_ten_articles_count'
    add_index :author_pubtypes, [:bibliome_id, :author_id, :all_articles_count], :name => 'index_author_pubtypes_on_bibliome_author_all_articles_count'
    add_index :author_pubtypes, [:bibliome_id, :author_id, :one_articles_count], :name => 'index_author_pubtypes_on_bibliome_author_one_articles_count'
    add_index :author_pubtypes, [:bibliome_id, :author_id, :five_articles_count], :name => 'index_author_pubtypes_on_bibliome_author_five_articles_count'
    add_index :author_pubtypes, [:bibliome_id, :author_id, :ten_articles_count], :name => 'index_author_pubtypes_on_bibliome_author_ten_articles_count'
  end

  def self.down
    drop_table :author_pubtypes
  end
end
