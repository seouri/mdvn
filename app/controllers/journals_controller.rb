class JournalsController < ApplicationController
  def index
    @journals = @bibliome.journals.period(@period).paginate(:page => params[:page], :per_page => 10, :total_entries => @bibliome.send("#{@period}_journals_count"))
  end

  def show
    @journal = Journal.find(params[:id])
    @authors = AuthorJournal.find(:all, :conditions => {:bibliome_id => @bibliome.id, :journal_id => @journal.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:author, :bibliome])
    @subjects = JournalSubject.find(:all, :conditions => {:bibliome_id => @bibliome.id, :journal_id => @journal.id, :year => @period}, :order => "direct desc", :limit => 10, :include => [:subject, :bibliome])
    @pubtypes = JournalPubtype.find(:all, :conditions => {:bibliome_id => @bibliome.id, :journal_id => @journal.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:pubtype, :bibliome])
  end
end
