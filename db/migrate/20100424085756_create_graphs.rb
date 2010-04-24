class CreateGraphs < ActiveRecord::Migration
  def self.up
    create_table :graphs do |t|
      t.integer :bibliome_id
      t.references :source, :polymorphic => true
      t.references :target, :polymorphic => true
      t.integer :all_articles_count,  :default => 0, :limit => 3
      t.integer :one_articles_count,  :default => 0, :limit => 3
      t.integer :five_articles_count, :default => 0, :limit => 3
      t.integer :ten_articles_count,  :default => 0, :limit => 3
      t.integer :start_year,          :default => 0,  :limit => 2
      t.integer :end_year,            :default => 0,  :limit => 2
      t.text :articles_counts
    end
  end

  def self.down
    drop_table :graphs
  end
end
