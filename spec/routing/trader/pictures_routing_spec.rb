require "spec_helper"

describe Trader::PicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/trader/pictures").should route_to("trader/pictures#index")
    end

    it "routes to #new" do
      get("/trader/pictures/new").should route_to("trader/pictures#new")
    end

    it "routes to #show" do
      get("/trader/pictures/1").should route_to("trader/pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trader/pictures/1/edit").should route_to("trader/pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trader/pictures").should route_to("trader/pictures#create")
    end

    it "routes to #update" do
      put("/trader/pictures/1").should route_to("trader/pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trader/pictures/1").should route_to("trader/pictures#destroy", :id => "1")
    end

  end
end
