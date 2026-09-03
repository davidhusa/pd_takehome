class Deal
  attr_accessor :stage, :percent, :value, :currency_code
  STAGE_TO_KEY = {
    'Request for Info' => 'requestForInfo'
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
      all.sort_by(&:percent).group_by(&:stage).map do |stage, deals|
        [ 
          STAGE_TO_KEY[stage] || stage.downcase,
          deals.reduce(0.0) { |sum, deal| sum + deal.value }
        ]
      end.to_h
    end
  end

  def initialize(deal_data)
    @stage = deal_data["deal_stage"]["name"]
    @percent = deal_data["deal_stage"]["percent"]
    @value = deal_data["value"].to_f
    @currency_code = deal_data["currency"]["code"] # unused, but would be necessary for currency conversion if all the test data wasn't USD
  end

  private
  def self.pipeline_deals_service
    @pipeline_deals_service ||= PipelineDealsService.new
  end
end
