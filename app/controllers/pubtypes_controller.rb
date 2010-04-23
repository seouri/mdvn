class PubtypesController < ApplicationController
  def index
    @pubtypes = @bibliome.pubtypes.period(@period).paginate(:page => params[:page], :per_page => 10, :total_entries => @bibliome.send("#{@period}_pubtypes_count"))
  end

  def show
    @pubtype = Pubtype.find(params[:id])
    @journals = JournalPubtype.find(:all, :conditions => {:bibliome_id => @bibliome.id, :pubtype_id => @pubtype.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:journal, :bibliome])    
    @authors = AuthorPubtype.find(:all, :conditions => {:bibliome_id => @bibliome.id, :pubtype_id => @pubtype.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:author, :bibliome])
  end
end
