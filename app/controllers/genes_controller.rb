class GenesController < ApplicationController
  def index
    @genes = @bibliome.genes.period(@period).paginate(:page => params[:page], :per_page => 10, :total_entries => @bibliome.send("#{@period}_genes_count"))
  end

  def show
    @gene = Gene.find(params[:id])
  end
end
