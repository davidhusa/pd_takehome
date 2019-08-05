class HomeController < ApplicationController
  def index
  end

  def deals
    render json: Deal.total_value_by_deal_stage
  end
end
