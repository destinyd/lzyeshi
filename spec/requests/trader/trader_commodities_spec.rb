require 'spec_helper'

describe "Trader::Commodities" do
  describe "GET /trader_commodities" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get trader_commodities_path
      response.status.should be(200)
    end
  end
end
