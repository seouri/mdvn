class CreateCoauthorships < ActiveRecord::Migration
  def self.up
    create_table :coauthorships do |t|
      t.integer :bibliome_id
      t.integer :author_id
      t.integer :coauthor_id
      t.integer :all_articles_count,  :default => 0,  :limit => 3
      t.integer :one_articles_count,  :default => 0,  :limit => 3
      t.integer :five_articles_count, :default => 0,  :limit => 3
      t.integer :ten_articles_count,  :default => 0,  :limit => 3
      t.integer :start_year,          :default => 0,  :limit => 2
      t.integer :end_year,            :default => 0,  :limit => 2
      t.text    :articles_counts
    end
    add_index :coauthorships, [:bibliome_id, :coauthor_id, :all_articles_count], :name => 'index_coauthorships_on_bibliome_coauthor_all_articles_count'
    add_index :coauthorships, [:bibliome_id, :coauthor_id, :one_articles_count], :name => 'index_coauthorships_on_bibliome_coauthor_one_articles_count'
    add_index :coauthorships, [:bibliome_id, :coauthor_id, :five_articles_count], :name => 'index_coauthorships_on_bibliome_coauthor_five_articles_count'
    add_index :coauthorships, [:bibliome_id, :coauthor_id, :ten_articles_count], :name => 'index_coauthorships_on_bibliome_coauthor_ten_articles_count'
    add_index :coauthorships, [:bibliome_id, :author_id, :all_articles_count], :name => 'index_coauthorships_on_bibliome_author_all_articles_count'
    add_index :coauthorships, [:bibliome_id, :author_id, :one_articles_count], :name => 'index_coauthorships_on_bibliome_author_one_articles_count'
    add_index :coauthorships, [:bibliome_id, :author_id, :five_articles_count], :name => 'index_coauthorships_on_bibliome_author_five_articles_count'
    add_index :coauthorships, [:bibliome_id, :author_id, :ten_articles_count], :name => 'index_coauthorships_on_bibliome_author_ten_articles_count'
  end

  def self.down
    drop_table :coauthorships
  end
end
