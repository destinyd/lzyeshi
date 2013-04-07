require "spec_helper"

describe Trader::LocationsController do
  describe "routing" do

    it "routes to #index" do
      get("/trader/locations").should route_to("trader/locations#index")
    end

    it "routes to #new" do
      get("/trader/locations/new").should route_to("trader/locations#new")
    end

    it "routes to #show" do
      get("/trader/locations/1").should route_to("trader/locations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trader/locations/1/edit").should route_to("trader/locations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trader/locations").should route_to("trader/locations#create")
    end

    it "routes to #update" do
      put("/trader/locations/1").should route_to("trader/locations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trader/locations/1").should route_to("trader/locations#destroy", :id => "1")
    end

  end
end
