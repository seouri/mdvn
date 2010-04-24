class CreateJournalSubjects < ActiveRecord::Migration
  def self.up
    create_table :journal_subjects do |t|
      t.integer :bibliome_id
      t.integer :journal_id
      t.integer :subject_id
      t.integer :all_articles_count,  :default => 0,  :limit => 3
      t.integer :one_articles_count,  :default => 0,  :limit => 3
      t.integer :five_articles_count, :default => 0,  :limit => 3
      t.integer :ten_articles_count,  :default => 0,  :limit => 3
      t.integer :start_year,          :default => 0,  :limit => 2
      t.integer :end_year,            :default => 0,  :limit => 2
      t.text    :articles_counts
    end
    add_index :journal_subjects, [:bibliome_id, :journal_id, :all_articles_count], :name => 'index_journal_subjects_on_bibliome_journal_all_articles_count'
    add_index :journal_subjects, [:bibliome_id, :journal_id, :one_articles_count], :name => 'index_journal_subjects_on_bibliome_journal_one_articles_count'
    add_index :journal_subjects, [:bibliome_id, :journal_id, :five_articles_count], :name => 'index_journal_subjects_on_bibliome_journal_five_articles_count'
    add_index :journal_subjects, [:bibliome_id, :journal_id, :ten_articles_count], :name => 'index_journal_subjects_on_bibliome_journal_ten_articles_count'
    add_index :journal_subjects, [:bibliome_id, :subject_id, :all_articles_count], :name => 'index_journal_subjects_on_bibliome_subject_all_articles_count'
    add_index :journal_subjects, [:bibliome_id, :subject_id, :one_articles_count], :name => 'index_journal_subjects_on_bibliome_subject_one_articles_count'
    add_index :journal_subjects, [:bibliome_id, :subject_id, :five_articles_count], :name => 'index_journal_subjects_on_bibliome_subject_five_articles_count'
    add_index :journal_subjects, [:bibliome_id, :subject_id, :ten_articles_count], :name => 'index_journal_subjects_on_bibliome_subject_ten_articles_count'
  end

  def self.down
    drop_table :journal_subjects
  end
end
