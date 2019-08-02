require 'test_helper'

class DealTest < ActiveSupport::TestCase

  test "Happy path" do
    Faraday.stub(:get, TestResponse.new('response_body')) do
      expectation = {"lost"=>799436.0800000001,
         "qualified"=>1073193.52,
         "requestForInfo"=>1187818.4600000002,
         "presentation"=>874859.32,
         "negotiation"=>639093.4099999998,
         "won"=>647072.5599999999}

      assert Deal.total_value_by_deal_stage == expectation
    end
  end

  test "No connection" do
    Faraday.stub(:get, TestResponse.new(nil, false)) do
      expectation = {}
      assert Deal.total_value_by_deal_stage == expectation
    end
  end

end
