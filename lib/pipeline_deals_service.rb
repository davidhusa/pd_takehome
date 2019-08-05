class PipelineDealsService
  require 'faraday'
  MAX_RECORDS_PER_REQUEST = 1000

  def get_deals(params = {})
    deals = []
    total = nil
    params[:api_key] ||= API_KEY
    params[:page] ||= 1

    until total.present? && deals.length >= [total, MAX_RECORDS_PER_REQUEST].min
      response = Faraday.get "https://api.pipelinedeals.com/api/v3/deals.json?#{params.to_query}"
      return unless response.success?

      response = JSON.parse(response.body)
      deals.concat(response['entries'])
      total = response['pagination']['total']

      params[:page] += 1
    end
    deals
  end
end
