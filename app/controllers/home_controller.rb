class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: Deal.total_value_by_deal_stage }
    end
  end
end
