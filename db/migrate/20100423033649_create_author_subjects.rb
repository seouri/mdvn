class CreateAuthorSubjects < ActiveRecord::Migration
  def self.up
    create_table :author_subjects do |t|
      t.integer :bibliome_id
      t.integer :author_id
      t.integer :subject_id
      t.integer :all_articles_count,  :default => 0,  :limit => 3
      t.integer :one_articles_count,  :default => 0,  :limit => 3
      t.integer :five_articles_count, :default => 0,  :limit => 3
      t.integer :ten_articles_count,  :default => 0,  :limit => 3
      t.integer :start_year,          :default => 0,  :limit => 2
      t.integer :end_year,            :default => 0,  :limit => 2
      t.text    :articles_counts
    end
    add_index :author_subjects, [:bibliome_id, :subject_id, :all_articles_count], :name => 'index_author_subjects_on_bibliome_subject_all_articles_count'
    add_index :author_subjects, [:bibliome_id, :subject_id, :one_articles_count], :name => 'index_author_subjects_on_bibliome_subject_one_articles_count'
    add_index :author_subjects, [:bibliome_id, :subject_id, :five_articles_count], :name => 'index_author_subjects_on_bibliome_subject_five_articles_count'
    add_index :author_subjects, [:bibliome_id, :subject_id, :ten_articles_count], :name => 'index_author_subjects_on_bibliome_subject_ten_articles_count'
    add_index :author_subjects, [:bibliome_id, :author_id, :all_articles_count], :name => 'index_author_subjects_on_bibliome_author_all_articles_count'
    add_index :author_subjects, [:bibliome_id, :author_id, :one_articles_count], :name => 'index_author_subjects_on_bibliome_author_one_articles_count'
    add_index :author_subjects, [:bibliome_id, :author_id, :five_articles_count], :name => 'index_author_subjects_on_bibliome_author_five_articles_count'
    add_index :author_subjects, [:bibliome_id, :author_id, :ten_articles_count], :name => 'index_author_subjects_on_bibliome_author_ten_articles_count'
  end

  def self.down
    drop_table :author_subjects
  end
end
