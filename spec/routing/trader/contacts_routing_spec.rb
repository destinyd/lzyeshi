require "spec_helper"

describe Trader::ContactsController do
  describe "routing" do

    it "routes to #index" do
      get("/trader/contacts").should route_to("trader/contacts#index")
    end

    it "routes to #new" do
      get("/trader/contacts/new").should route_to("trader/contacts#new")
    end

    it "routes to #show" do
      get("/trader/contacts/1").should route_to("trader/contacts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trader/contacts/1/edit").should route_to("trader/contacts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trader/contacts").should route_to("trader/contacts#create")
    end

    it "routes to #update" do
      put("/trader/contacts/1").should route_to("trader/contacts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trader/contacts/1").should route_to("trader/contacts#destroy", :id => "1")
    end

  end
end
