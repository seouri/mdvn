class AuthorsController < ApplicationController
  def index
    @authors = @bibliome.authors.period(@period).paginate(:page => params[:page], :per_page => 10, :total_entries => @bibliome.send("#{@period}_authors_count"))
  end

  def show
    @author = Author.find(params[:id])
    @journals = AuthorJournal.find(:all, :conditions => {:bibliome_id => @bibliome.id, :author_id => @author.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:journal, :bibliome])
    @coauthors = Coauthorship.find(:all, :conditions => {:bibliome_id => @bibliome.id, :author_id => @author.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:coauthor, :bibliome])
    @subjects = AuthorSubject.find(:all, :conditions => {:bibliome_id => @bibliome.id, :author_id => @author.id, :year => @period}, :order => "total_direct desc", :limit => 10, :include => [:subject, :bibliome])
    @pubtypes = AuthorPubtype.find(:all, :conditions => {:bibliome_id => @bibliome.id, :author_id => @author.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:pubtype, :bibliome])
  end
end
