require "spec_helper"

describe Admin::ApksController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/apks").should route_to("admin/apks#index")
    end

    it "routes to #new" do
      get("/admin/apks/new").should route_to("admin/apks#new")
    end

    it "routes to #show" do
      get("/admin/apks/1").should route_to("admin/apks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/apks/1/edit").should route_to("admin/apks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/apks").should route_to("admin/apks#create")
    end

    it "routes to #update" do
      put("/admin/apks/1").should route_to("admin/apks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/apks/1").should route_to("admin/apks#destroy", :id => "1")
    end

  end
end
