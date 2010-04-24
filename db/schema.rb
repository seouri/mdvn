# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100424085756) do

  create_table "article_types", :force => true do |t|
    t.integer "article_id"
    t.integer "pubtype_id"
  end

  add_index "article_types", ["article_id"], :name => "index_article_types_on_article_id"

  create_table "articles", :force => true do |t|
    t.integer "journal_id"
    t.date    "pubdate"
    t.text    "title"
    t.text    "affiliation"
    t.string  "source"
    t.integer "bibliomes_count", :default => 0
  end

  add_index "articles", ["journal_id", "pubdate"], :name => "index_articles_on_journal_id_and_pubdate"
  add_index "articles", ["pubdate"], :name => "index_articles_on_pubdate"

  create_table "author_genes", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "author_id"
    t.integer "gene_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "author_genes", ["bibliome_id", "author_id", "all_articles_count"], :name => "index_author_genes_on_bibliome_author_all_articles_count"
  add_index "author_genes", ["bibliome_id", "author_id", "five_articles_count"], :name => "index_author_genes_on_bibliome_author_five_articles_count"
  add_index "author_genes", ["bibliome_id", "author_id", "one_articles_count"], :name => "index_author_genes_on_bibliome_author_one_articles_count"
  add_index "author_genes", ["bibliome_id", "author_id", "ten_articles_count"], :name => "index_author_genes_on_bibliome_author_ten_articles_count"
  add_index "author_genes", ["bibliome_id", "gene_id", "all_articles_count"], :name => "index_author_genes_on_bibliome_gene_all_articles_count"
  add_index "author_genes", ["bibliome_id", "gene_id", "five_articles_count"], :name => "index_author_genes_on_bibliome_gene_five_articles_count"
  add_index "author_genes", ["bibliome_id", "gene_id", "one_articles_count"], :name => "index_author_genes_on_bibliome_gene_one_articles_count"
  add_index "author_genes", ["bibliome_id", "gene_id", "ten_articles_count"], :name => "index_author_genes_on_bibliome_gene_ten_articles_count"

  create_table "author_journals", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "author_id"
    t.integer "journal_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "author_journals", ["bibliome_id", "author_id", "all_articles_count"], :name => "index_author_journals_on_bibliome_author_all_articles_count"
  add_index "author_journals", ["bibliome_id", "author_id", "five_articles_count"], :name => "index_author_journals_on_bibliome_author_five_articles_count"
  add_index "author_journals", ["bibliome_id", "author_id", "one_articles_count"], :name => "index_author_journals_on_bibliome_author_one_articles_count"
  add_index "author_journals", ["bibliome_id", "author_id", "ten_articles_count"], :name => "index_author_journals_on_bibliome_author_ten_articles_count"
  add_index "author_journals", ["bibliome_id", "journal_id", "all_articles_count"], :name => "index_author_journals_on_bibliome_journal_all_articles_count"
  add_index "author_journals", ["bibliome_id", "journal_id", "five_articles_count"], :name => "index_author_journals_on_bibliome_journal_five_articles_count"
  add_index "author_journals", ["bibliome_id", "journal_id", "one_articles_count"], :name => "index_author_journals_on_bibliome_journal_one_articles_count"
  add_index "author_journals", ["bibliome_id", "journal_id", "ten_articles_count"], :name => "index_author_journals_on_bibliome_journal_ten_articles_count"

  create_table "author_pubtypes", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "author_id"
    t.integer "pubtype_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "author_pubtypes", ["bibliome_id", "author_id", "all_articles_count"], :name => "index_author_pubtypes_on_bibliome_author_all_articles_count"
  add_index "author_pubtypes", ["bibliome_id", "author_id", "five_articles_count"], :name => "index_author_pubtypes_on_bibliome_author_five_articles_count"
  add_index "author_pubtypes", ["bibliome_id", "author_id", "one_articles_count"], :name => "index_author_pubtypes_on_bibliome_author_one_articles_count"
  add_index "author_pubtypes", ["bibliome_id", "author_id", "ten_articles_count"], :name => "index_author_pubtypes_on_bibliome_author_ten_articles_count"
  add_index "author_pubtypes", ["bibliome_id", "pubtype_id", "all_articles_count"], :name => "index_author_pubtypes_on_bibliome_pubtype_all_articles_count"
  add_index "author_pubtypes", ["bibliome_id", "pubtype_id", "five_articles_count"], :name => "index_author_pubtypes_on_bibliome_pubtype_five_articles_count"
  add_index "author_pubtypes", ["bibliome_id", "pubtype_id", "one_articles_count"], :name => "index_author_pubtypes_on_bibliome_pubtype_one_articles_count"
  add_index "author_pubtypes", ["bibliome_id", "pubtype_id", "ten_articles_count"], :name => "index_author_pubtypes_on_bibliome_pubtype_ten_articles_count"

  create_table "author_subjects", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "author_id"
    t.integer "subject_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "author_subjects", ["bibliome_id", "author_id", "all_articles_count"], :name => "index_author_subjects_on_bibliome_author_all_articles_count"
  add_index "author_subjects", ["bibliome_id", "author_id", "five_articles_count"], :name => "index_author_subjects_on_bibliome_author_five_articles_count"
  add_index "author_subjects", ["bibliome_id", "author_id", "one_articles_count"], :name => "index_author_subjects_on_bibliome_author_one_articles_count"
  add_index "author_subjects", ["bibliome_id", "author_id", "ten_articles_count"], :name => "index_author_subjects_on_bibliome_author_ten_articles_count"
  add_index "author_subjects", ["bibliome_id", "subject_id", "all_articles_count"], :name => "index_author_subjects_on_bibliome_subject_all_articles_count"
  add_index "author_subjects", ["bibliome_id", "subject_id", "five_articles_count"], :name => "index_author_subjects_on_bibliome_subject_five_articles_count"
  add_index "author_subjects", ["bibliome_id", "subject_id", "one_articles_count"], :name => "index_author_subjects_on_bibliome_subject_one_articles_count"
  add_index "author_subjects", ["bibliome_id", "subject_id", "ten_articles_count"], :name => "index_author_subjects_on_bibliome_subject_ten_articles_count"

  create_table "authors", :force => true do |t|
    t.string "last_name"
    t.string "fore_name"
    t.string "initials"
    t.string "suffix"
  end

  add_index "authors", ["last_name", "fore_name", "initials", "suffix"], :name => "index_authors_on_last_name_fore_name_initials_suffix", :unique => true
  add_index "authors", ["last_name", "initials"], :name => "index_authors_on_last_name_and_initials"

  create_table "authorships", :force => true do |t|
    t.integer "article_id"
    t.integer "author_id"
    t.integer "position"
    t.integer "last_position"
  end

  add_index "authorships", ["article_id", "position"], :name => "index_authorships_on_article_id_and_position"
  add_index "authorships", ["author_id"], :name => "index_authorships_on_author_id"

  create_table "bibliome_articles", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "article_id"
    t.date    "pubdate"
  end

  add_index "bibliome_articles", ["bibliome_id", "pubdate", "article_id"], :name => "index_bibliome_articles_on_bibliome_id_pubdate_article_id"

  create_table "bibliome_authors", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "author_id"
    t.integer "all_articles_count",         :limit => 3, :default => 0
    t.integer "one_articles_count",         :limit => 3, :default => 0
    t.integer "five_articles_count",        :limit => 3, :default => 0
    t.integer "ten_articles_count",         :limit => 3, :default => 0
    t.integer "all_first_articles_count",   :limit => 3, :default => 0
    t.integer "one_first_articles_count",   :limit => 3, :default => 0
    t.integer "five_first_articles_count",  :limit => 3, :default => 0
    t.integer "ten_first_articles_count",   :limit => 3, :default => 0
    t.integer "all_last_articles_count",    :limit => 3, :default => 0
    t.integer "one_last_articles_count",    :limit => 3, :default => 0
    t.integer "five_last_articles_count",   :limit => 3, :default => 0
    t.integer "ten_last_articles_count",    :limit => 3, :default => 0
    t.integer "all_middle_articles_count",  :limit => 3, :default => 0
    t.integer "one_middle_articles_count",  :limit => 3, :default => 0
    t.integer "five_middle_articles_count", :limit => 3, :default => 0
    t.integer "ten_middle_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",                 :limit => 2, :default => 0
    t.integer "end_year",                   :limit => 2, :default => 0
    t.text    "articles_counts"
    t.text    "first_articles_counts"
    t.text    "last_articles_counts"
    t.text    "middle_articles_counts"
  end

  add_index "bibliome_authors", ["bibliome_id", "author_id", "all_articles_count"], :name => "index_bibliome_authors_on_bibliome_author_articles_count"
  add_index "bibliome_authors", ["bibliome_id", "author_id", "five_articles_count"], :name => "index_bibliome_authors_on_bibliome_author_five_articles_count"
  add_index "bibliome_authors", ["bibliome_id", "author_id", "one_articles_count"], :name => "index_bibliome_authors_on_bibliome_author_one_articles_count"
  add_index "bibliome_authors", ["bibliome_id", "author_id", "ten_articles_count"], :name => "index_bibliome_authors_on_bibliome_author_ten_articles_count"

  create_table "bibliome_genes", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "gene_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "bibliome_genes", ["bibliome_id", "gene_id", "all_articles_count"], :name => "index_bibliome_genes_on_bibliome_gene_all_articles_count"
  add_index "bibliome_genes", ["bibliome_id", "gene_id", "five_articles_count"], :name => "index_bibliome_genes_on_bibliome_gene_five_articles_count"
  add_index "bibliome_genes", ["bibliome_id", "gene_id", "one_articles_count"], :name => "index_bibliome_genes_on_bibliome_gene_one_articles_count"
  add_index "bibliome_genes", ["bibliome_id", "gene_id", "ten_articles_count"], :name => "index_bibliome_genes_on_bibliome_gene_ten_articles_count"

  create_table "bibliome_journals", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "journal_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "bibliome_journals", ["bibliome_id", "journal_id", "all_articles_count"], :name => "index_bibliome_journals_on_bibliome_journal_all_articles_count"
  add_index "bibliome_journals", ["bibliome_id", "journal_id", "five_articles_count"], :name => "index_bibliome_journals_on_bibliome_journal_five_articles_count"
  add_index "bibliome_journals", ["bibliome_id", "journal_id", "one_articles_count"], :name => "index_bibliome_journals_on_bibliome_journal_one_articles_count"
  add_index "bibliome_journals", ["bibliome_id", "journal_id", "ten_articles_count"], :name => "index_bibliome_journals_on_bibliome_journal_ten_articles_count"

  create_table "bibliome_pubtypes", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "pubtype_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "bibliome_pubtypes", ["bibliome_id", "pubtype_id", "all_articles_count"], :name => "index_bibliome_pubtypes_on_bibliome_pubtype_all_articles_count"
  add_index "bibliome_pubtypes", ["bibliome_id", "pubtype_id", "five_articles_count"], :name => "index_bibliome_pubtypes_on_bibliome_pubtype_five_articles_count"
  add_index "bibliome_pubtypes", ["bibliome_id", "pubtype_id", "one_articles_count"], :name => "index_bibliome_pubtypes_on_bibliome_pubtype_one_articles_count"
  add_index "bibliome_pubtypes", ["bibliome_id", "pubtype_id", "ten_articles_count"], :name => "index_bibliome_pubtypes_on_bibliome_pubtype_ten_articles_count"

  create_table "bibliome_subjects", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "subject_id"
    t.integer "all_articles_count",             :limit => 3, :default => 0
    t.integer "one_articles_count",             :limit => 3, :default => 0
    t.integer "five_articles_count",            :limit => 3, :default => 0
    t.integer "ten_articles_count",             :limit => 3, :default => 0
    t.integer "all_direct_articles_count",      :limit => 3, :default => 0
    t.integer "one_direct_articles_count",      :limit => 3, :default => 0
    t.integer "five_direct_articles_count",     :limit => 3, :default => 0
    t.integer "ten_direct_articles_count",      :limit => 3, :default => 0
    t.integer "all_descendant_articles_count",  :limit => 3, :default => 0
    t.integer "one_descendant_articles_count",  :limit => 3, :default => 0
    t.integer "five_descendant_articles_count", :limit => 3, :default => 0
    t.integer "ten_descendant_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",                     :limit => 2, :default => 0
    t.integer "end_year",                       :limit => 2, :default => 0
    t.text    "articles_counts"
    t.text    "direct_articles_counts"
    t.text    "descendant_articles_counts"
  end

  add_index "bibliome_subjects", ["bibliome_id", "subject_id", "all_articles_count"], :name => "index_bibliome_subjects_on_bibliome_subject_all_articles_count"
  add_index "bibliome_subjects", ["bibliome_id", "subject_id", "five_articles_count"], :name => "index_bibliome_subjects_on_bibliome_subject_five_articles_count"
  add_index "bibliome_subjects", ["bibliome_id", "subject_id", "one_articles_count"], :name => "index_bibliome_subjects_on_bibliome_subject_one_articles_count"
  add_index "bibliome_subjects", ["bibliome_id", "subject_id", "ten_articles_count"], :name => "index_bibliome_subjects_on_bibliome_subject_ten_articles_count"

  create_table "bibliomes", :force => true do |t|
    t.string   "name"
    t.text     "query"
    t.integer  "all_articles_count",  :default => 0
    t.integer  "all_journals_count",  :default => 0
    t.integer  "all_authors_count",   :default => 0
    t.integer  "all_subjects_count",  :default => 0
    t.integer  "all_genes_count",     :default => 0
    t.integer  "all_pubtypes_count",  :default => 0
    t.integer  "one_articles_count",  :default => 0
    t.integer  "one_journals_count",  :default => 0
    t.integer  "one_authors_count",   :default => 0
    t.integer  "one_subjects_count",  :default => 0
    t.integer  "one_genes_count",     :default => 0
    t.integer  "one_pubtypes_count",  :default => 0
    t.integer  "five_articles_count", :default => 0
    t.integer  "five_journals_count", :default => 0
    t.integer  "five_authors_count",  :default => 0
    t.integer  "five_subjects_count", :default => 0
    t.integer  "five_genes_count",    :default => 0
    t.integer  "five_pubtypes_count", :default => 0
    t.integer  "ten_articles_count",  :default => 0
    t.integer  "ten_journals_count",  :default => 0
    t.integer  "ten_authors_count",   :default => 0
    t.integer  "ten_subjects_count",  :default => 0
    t.integer  "ten_genes_count",     :default => 0
    t.integer  "ten_pubtypes_count",  :default => 0
    t.integer  "total_articles",      :default => 0
    t.integer  "hits",                :default => 0
    t.boolean  "built",               :default => false
    t.datetime "started_at"
    t.datetime "built_at"
    t.datetime "delete_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bibliomes", ["built", "built_at"], :name => "index_bibliomes_on_built_and_built_at"
  add_index "bibliomes", ["hits"], :name => "index_bibliomes_on_hits"
  add_index "bibliomes", ["name"], :name => "index_bibliomes_on_name", :unique => true

  create_table "coauthorships", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "author_id"
    t.integer "coauthor_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "coauthorships", ["bibliome_id", "author_id", "all_articles_count"], :name => "index_coauthorships_on_bibliome_author_all_articles_count"
  add_index "coauthorships", ["bibliome_id", "author_id", "five_articles_count"], :name => "index_coauthorships_on_bibliome_author_five_articles_count"
  add_index "coauthorships", ["bibliome_id", "author_id", "one_articles_count"], :name => "index_coauthorships_on_bibliome_author_one_articles_count"
  add_index "coauthorships", ["bibliome_id", "author_id", "ten_articles_count"], :name => "index_coauthorships_on_bibliome_author_ten_articles_count"
  add_index "coauthorships", ["bibliome_id", "coauthor_id", "all_articles_count"], :name => "index_coauthorships_on_bibliome_coauthor_all_articles_count"
  add_index "coauthorships", ["bibliome_id", "coauthor_id", "five_articles_count"], :name => "index_coauthorships_on_bibliome_coauthor_five_articles_count"
  add_index "coauthorships", ["bibliome_id", "coauthor_id", "one_articles_count"], :name => "index_coauthorships_on_bibliome_coauthor_one_articles_count"
  add_index "coauthorships", ["bibliome_id", "coauthor_id", "ten_articles_count"], :name => "index_coauthorships_on_bibliome_coauthor_ten_articles_count"

  create_table "cosubjectships", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "subject_id"
    t.integer "cosubject_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "cosubjectships", ["bibliome_id", "cosubject_id", "all_articles_count"], :name => "index_cosubjectships_on_bibliome_cosubject_all_articles_count"
  add_index "cosubjectships", ["bibliome_id", "cosubject_id", "five_articles_count"], :name => "index_cosubjectships_on_bibliome_cosubject_five_articles_count"
  add_index "cosubjectships", ["bibliome_id", "cosubject_id", "one_articles_count"], :name => "index_cosubjectships_on_bibliome_cosubject_one_articles_count"
  add_index "cosubjectships", ["bibliome_id", "cosubject_id", "ten_articles_count"], :name => "index_cosubjectships_on_bibliome_cosubject_ten_articles_count"
  add_index "cosubjectships", ["bibliome_id", "subject_id", "all_articles_count"], :name => "index_cosubjectships_on_bibliome_subject_all_articles_count"
  add_index "cosubjectships", ["bibliome_id", "subject_id", "five_articles_count"], :name => "index_cosubjectships_on_bibliome_subject_five_articles_count"
  add_index "cosubjectships", ["bibliome_id", "subject_id", "one_articles_count"], :name => "index_cosubjectships_on_bibliome_subject_one_articles_count"
  add_index "cosubjectships", ["bibliome_id", "subject_id", "ten_articles_count"], :name => "index_cosubjectships_on_bibliome_subject_ten_articles_count"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genes", :force => true do |t|
    t.integer "taxonomy_id"
    t.string  "symbol"
    t.string  "chromosome"
    t.string  "map_location"
  end

  add_index "genes", ["symbol"], :name => "index_genes_on_symbol"

  create_table "graphs", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "source_id"
    t.string  "source_type"
    t.integer "target_id"
    t.string  "target_type"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  create_table "journal_genes", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "journal_id"
    t.integer "gene_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "journal_genes", ["bibliome_id", "gene_id", "all_articles_count"], :name => "index_journal_genes_on_bibliome_gene_all_articles_count"
  add_index "journal_genes", ["bibliome_id", "gene_id", "five_articles_count"], :name => "index_journal_genes_on_bibliome_gene_five_articles_count"
  add_index "journal_genes", ["bibliome_id", "gene_id", "one_articles_count"], :name => "index_journal_genes_on_bibliome_gene_one_articles_count"
  add_index "journal_genes", ["bibliome_id", "gene_id", "ten_articles_count"], :name => "index_journal_genes_on_bibliome_gene_ten_articles_count"
  add_index "journal_genes", ["bibliome_id", "journal_id", "all_articles_count"], :name => "index_journal_genes_on_bibliome_journal_all_articles_count"
  add_index "journal_genes", ["bibliome_id", "journal_id", "five_articles_count"], :name => "index_journal_genes_on_bibliome_journal_five_articles_count"
  add_index "journal_genes", ["bibliome_id", "journal_id", "one_articles_count"], :name => "index_journal_genes_on_bibliome_journal_one_articles_count"
  add_index "journal_genes", ["bibliome_id", "journal_id", "ten_articles_count"], :name => "index_journal_genes_on_bibliome_journal_ten_articles_count"

  create_table "journal_pubtypes", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "journal_id"
    t.integer "pubtype_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "journal_pubtypes", ["bibliome_id", "journal_id", "all_articles_count"], :name => "index_journal_pubtypes_on_bibliome_journal_all_articles_count"
  add_index "journal_pubtypes", ["bibliome_id", "journal_id", "five_articles_count"], :name => "index_journal_pubtypes_on_bibliome_journal_five_articles_count"
  add_index "journal_pubtypes", ["bibliome_id", "journal_id", "one_articles_count"], :name => "index_journal_pubtypes_on_bibliome_journal_one_articles_count"
  add_index "journal_pubtypes", ["bibliome_id", "journal_id", "ten_articles_count"], :name => "index_journal_pubtypes_on_bibliome_journal_ten_articles_count"
  add_index "journal_pubtypes", ["bibliome_id", "pubtype_id", "all_articles_count"], :name => "index_journal_pubtypes_on_bibliome_pubtype_all_articles_count"
  add_index "journal_pubtypes", ["bibliome_id", "pubtype_id", "five_articles_count"], :name => "index_journal_pubtypes_on_bibliome_pubtype_five_articles_count"
  add_index "journal_pubtypes", ["bibliome_id", "pubtype_id", "one_articles_count"], :name => "index_journal_pubtypes_on_bibliome_pubtype_one_articles_count"
  add_index "journal_pubtypes", ["bibliome_id", "pubtype_id", "ten_articles_count"], :name => "index_journal_pubtypes_on_bibliome_pubtype_ten_articles_count"

  create_table "journal_subjects", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "journal_id"
    t.integer "subject_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "journal_subjects", ["bibliome_id", "journal_id", "all_articles_count"], :name => "index_journal_subjects_on_bibliome_journal_all_articles_count"
  add_index "journal_subjects", ["bibliome_id", "journal_id", "five_articles_count"], :name => "index_journal_subjects_on_bibliome_journal_five_articles_count"
  add_index "journal_subjects", ["bibliome_id", "journal_id", "one_articles_count"], :name => "index_journal_subjects_on_bibliome_journal_one_articles_count"
  add_index "journal_subjects", ["bibliome_id", "journal_id", "ten_articles_count"], :name => "index_journal_subjects_on_bibliome_journal_ten_articles_count"
  add_index "journal_subjects", ["bibliome_id", "subject_id", "all_articles_count"], :name => "index_journal_subjects_on_bibliome_subject_all_articles_count"
  add_index "journal_subjects", ["bibliome_id", "subject_id", "five_articles_count"], :name => "index_journal_subjects_on_bibliome_subject_five_articles_count"
  add_index "journal_subjects", ["bibliome_id", "subject_id", "one_articles_count"], :name => "index_journal_subjects_on_bibliome_subject_one_articles_count"
  add_index "journal_subjects", ["bibliome_id", "subject_id", "ten_articles_count"], :name => "index_journal_subjects_on_bibliome_subject_ten_articles_count"

  create_table "journals", :force => true do |t|
    t.string "title"
    t.string "abbr"
  end

  add_index "journals", ["abbr", "title"], :name => "index_journals_on_abbr_and_title"

  create_table "mesh_ancestors", :force => true do |t|
    t.integer "subject_id"
    t.integer "ancestor_id"
  end

  add_index "mesh_ancestors", ["subject_id"], :name => "index_mesh_ancestors_on_subject_id"

  create_table "mesh_trees", :force => true do |t|
    t.string  "tree_number"
    t.integer "subject_id"
    t.integer "parent_id"
  end

  add_index "mesh_trees", ["parent_id"], :name => "index_mesh_trees_on_parent_id"
  add_index "mesh_trees", ["subject_id"], :name => "index_mesh_trees_on_subject_id"
  add_index "mesh_trees", ["tree_number"], :name => "index_mesh_trees_on_tree_number", :unique => true

  create_table "published_genes", :force => true do |t|
    t.integer "article_id"
    t.integer "gene_id"
  end

  add_index "published_genes", ["article_id"], :name => "index_published_genes_on_article_id"

  create_table "pubtypes", :force => true do |t|
    t.string "term"
  end

  add_index "pubtypes", ["term"], :name => "index_pubtypes_on_term"

  create_table "subject_genes", :force => true do |t|
    t.integer "bibliome_id"
    t.integer "subject_id"
    t.integer "gene_id"
    t.integer "all_articles_count",  :limit => 3, :default => 0
    t.integer "one_articles_count",  :limit => 3, :default => 0
    t.integer "five_articles_count", :limit => 3, :default => 0
    t.integer "ten_articles_count",  :limit => 3, :default => 0
    t.integer "start_year",          :limit => 2, :default => 0
    t.integer "end_year",            :limit => 2, :default => 0
    t.text    "articles_counts"
  end

  add_index "subject_genes", ["bibliome_id", "gene_id", "all_articles_count"], :name => "index_subject_genes_on_bibliome_gene_all_articles_count"
  add_index "subject_genes", ["bibliome_id", "gene_id", "five_articles_count"], :name => "index_subject_genes_on_bibliome_gene_five_articles_count"
  add_index "subject_genes", ["bibliome_id", "gene_id", "one_articles_count"], :name => "index_subject_genes_on_bibliome_gene_one_articles_count"
  add_index "subject_genes", ["bibliome_id", "gene_id", "ten_articles_count"], :name => "index_subject_genes_on_bibliome_gene_ten_articles_count"
  add_index "subject_genes", ["bibliome_id", "subject_id", "all_articles_count"], :name => "index_subject_genes_on_bibliome_subject_all_articles_count"
  add_index "subject_genes", ["bibliome_id", "subject_id", "five_articles_count"], :name => "index_subject_genes_on_bibliome_subject_five_articles_count"
  add_index "subject_genes", ["bibliome_id", "subject_id", "one_articles_count"], :name => "index_subject_genes_on_bibliome_subject_one_articles_count"
  add_index "subject_genes", ["bibliome_id", "subject_id", "ten_articles_count"], :name => "index_subject_genes_on_bibliome_subject_ten_articles_count"

  create_table "subjects", :force => true do |t|
    t.string "term"
  end

  add_index "subjects", ["term"], :name => "index_subjects_on_term", :unique => true

  create_table "taxonomies", :force => true do |t|
    t.string "name"
  end

  create_table "topics", :force => true do |t|
    t.integer "article_id"
    t.integer "subject_id"
  end

  add_index "topics", ["article_id"], :name => "index_topics_on_article_id"

end
