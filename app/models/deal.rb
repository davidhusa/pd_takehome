class Deal
  attr_accessor :stage, :percent, :value, :currency_code
  STAGE_TO_PERCENT = {
    'Won' => 100,
    'Presentation' => 50,
    'Negotiation' => 75,
    'Request for Info' => 25,
    'Qualified' => 10,
    'Lost' => 0,
  }
  class << self
    def all
      deals = pipeline_deals_service.get_deals
      return [] unless deals

      deals.map do |deal|
        new(deal)
      end
    end

    def total_value_by_deal_stage
      all.group_by(&:stage).map do |stage, deals|
        [ 
          stage,
          deals.reduce(0.0) { |sum, deal| sum + deal.value }
        ]
      end.to_h
    end
  end

  def initialize(deal_data)
    @stage = deal_data["deal_stage"]["name"]
    @percent = deal_data["deal_stage"]["percent"]
    @value = deal_data["value"].to_f
    @currency_code = deal_data["currency"]["code"] # unused, but necessary for hypothetical currency conversion
  end

  private
  def self.pipeline_deals_service
    @pipeline_deals_service ||= PipelineDealsService.new
  end
end
