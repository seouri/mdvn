class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  before_filter :find_bibliome, :set_period

private
  def find_bibliome
    if params[:bibliome_id]
      @bibliome = Bibliome.find(params[:bibliome_id])
      @bibliome.hit!
    end
  end

  def set_period
    if ["one", "five", "ten"].include?(params[:period])
      @period = params[:period]
    else
      @period = "all"
    end
    @link_period = @period == "all" ? nil : @period
  end
end
