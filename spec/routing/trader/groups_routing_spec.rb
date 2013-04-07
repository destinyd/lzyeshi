require "spec_helper"

describe Trader::GroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/trader/groups").should route_to("trader/groups#index")
    end

    it "routes to #new" do
      get("/trader/groups/new").should route_to("trader/groups#new")
    end

    it "routes to #show" do
      get("/trader/groups/1").should route_to("trader/groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trader/groups/1/edit").should route_to("trader/groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trader/groups").should route_to("trader/groups#create")
    end

    it "routes to #update" do
      put("/trader/groups/1").should route_to("trader/groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trader/groups/1").should route_to("trader/groups#destroy", :id => "1")
    end

  end
end
