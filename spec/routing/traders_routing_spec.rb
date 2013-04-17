require "spec_helper"

describe TradersController do
  describe "routing" do

    it "routes to #index" do
      get("/traders").should route_to("traders#index")
    end

    it "routes to #new" do
      get("/traders/new").should route_to("traders#new")
    end

    it "routes to #show" do
      get("/traders/1").should route_to("traders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/traders/1/edit").should route_to("traders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/traders").should route_to("traders#create")
    end

    it "routes to #update" do
      put("/traders/1").should route_to("traders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/traders/1").should route_to("traders#destroy", :id => "1")
    end

  end
end
