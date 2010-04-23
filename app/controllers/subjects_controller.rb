class SubjectsController < ApplicationController
  def index
    @subjects = @bibliome.subjects.period(@period).paginate(:page => params[:page], :per_page => 10, :total_entries => @bibliome.send("#{@period}_subjects_count"))
  end

  def show
    @subject = Subject.find(params[:id])
    @journals = JournalSubject.find(:all, :conditions => {:bibliome_id => @bibliome.id, :subject_id => @subject.id, :year => @period}, :order => "total desc", :limit => 10, :include => [:journal, :bibliome])
    @authors = AuthorSubject.find(:all, :conditions => {:bibliome_id => @bibliome.id, :subject_id => @subject.id, :year => @period}, :order => "total_direct desc", :limit => 10, :include => [:author, :bibliome])
    @cosubjects = Cosubjectship.find(:all, :conditions => {:bibliome_id => @bibliome.id, :subject_id => @subject.id, :year => @period}, :order => "direct desc", :limit => 10, :include => [:cosubject, :bibliome])
  end
end
