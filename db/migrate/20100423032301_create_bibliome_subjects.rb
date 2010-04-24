class CreateBibliomeSubjects < ActiveRecord::Migration
  def self.up
    create_table :bibliome_subjects do |t|
      t.integer :bibliome_id
      t.integer :subject_id
      t.integer :all_articles_count,              :default => 0,  :limit => 3
      t.integer :one_articles_count,              :default => 0,  :limit => 3
      t.integer :five_articles_count,             :default => 0,  :limit => 3
      t.integer :ten_articles_count,              :default => 0,  :limit => 3
      t.integer :all_direct_articles_count,       :default => 0,  :limit => 3
      t.integer :one_direct_articles_count,       :default => 0,  :limit => 3
      t.integer :five_direct_articles_count,      :default => 0,  :limit => 3
      t.integer :ten_direct_articles_count,       :default => 0,  :limit => 3
      t.integer :all_descendant_articles_count,   :default => 0,  :limit => 3
      t.integer :one_descendant_articles_count,   :default => 0,  :limit => 3
      t.integer :five_descendant_articles_count,  :default => 0,  :limit => 3
      t.integer :ten_descendant_articles_count,   :default => 0,  :limit => 3
      t.integer :start_year,                      :default => 0,  :limit => 2
      t.integer :end_year,                        :default => 0,  :limit => 2
      t.text    :articles_counts
      t.text    :direct_articles_counts
      t.text    :descendant_articles_counts
    end
    add_index :bibliome_subjects, [:bibliome_id, :subject_id, :all_articles_count], :name => 'index_bibliome_subjects_on_bibliome_subject_all_articles_count'
    add_index :bibliome_subjects, [:bibliome_id, :subject_id, :one_articles_count], :name => 'index_bibliome_subjects_on_bibliome_subject_one_articles_count'
    add_index :bibliome_subjects, [:bibliome_id, :subject_id, :five_articles_count], :name => 'index_bibliome_subjects_on_bibliome_subject_five_articles_count'
    add_index :bibliome_subjects, [:bibliome_id, :subject_id, :ten_articles_count], :name => 'index_bibliome_subjects_on_bibliome_subject_ten_articles_count'
  end

  def self.down
    drop_table :bibliome_subjects
  end
end
