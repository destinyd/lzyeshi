require "spec_helper"

describe Trader::BillsController do
  describe "routing" do

    it "routes to #index" do
      get("/trader/bills").should route_to("trader/bills#index")
    end

    it "routes to #new" do
      get("/trader/bills/new").should route_to("trader/bills#new")
    end

    it "routes to #show" do
      get("/trader/bills/1").should route_to("trader/bills#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trader/bills/1/edit").should route_to("trader/bills#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trader/bills").should route_to("trader/bills#create")
    end

    it "routes to #update" do
      put("/trader/bills/1").should route_to("trader/bills#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trader/bills/1").should route_to("trader/bills#destroy", :id => "1")
    end

  end
end
