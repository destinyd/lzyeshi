require "spec_helper"

describe Trader::CommoditiesController do
  describe "routing" do

    it "routes to #index" do
      get("/trader/commodities").should route_to("trader/commodities#index")
    end

    it "routes to #new" do
      get("/trader/commodities/new").should route_to("trader/commodities#new")
    end

    it "routes to #show" do
      get("/trader/commodities/1").should route_to("trader/commodities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trader/commodities/1/edit").should route_to("trader/commodities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trader/commodities").should route_to("trader/commodities#create")
    end

    it "routes to #update" do
      put("/trader/commodities/1").should route_to("trader/commodities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trader/commodities/1").should route_to("trader/commodities#destroy", :id => "1")
    end

  end
end
