class V1::DealsController < ApplicationController
  def index
    render json: Deal.total_value_by_deal_stage
  end
end
