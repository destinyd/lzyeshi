require "spec_helper"

describe Admin::AdsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/ads").should route_to("admin/ads#index")
    end

    it "routes to #new" do
      get("/admin/ads/new").should route_to("admin/ads#new")
    end

    it "routes to #show" do
      get("/admin/ads/1").should route_to("admin/ads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/ads/1/edit").should route_to("admin/ads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/ads").should route_to("admin/ads#create")
    end

    it "routes to #update" do
      put("/admin/ads/1").should route_to("admin/ads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/ads/1").should route_to("admin/ads#destroy", :id => "1")
    end

  end
end
