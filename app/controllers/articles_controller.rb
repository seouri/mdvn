class ArticlesController < ApplicationController
  def index
    @articles = @bibliome.articles.paginate(:page => params[:page], :per_page => 10, :include => [:authors, :subjects], :total_entries => @bibliome.send("#{@period}_articles_count"))
  end

  def show
    @article = Article.find(params[:id])
  end
end
