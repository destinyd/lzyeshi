require "spec_helper"

describe User::MpUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/user/mp_users").should route_to("user/mp_users#index")
    end

    it "routes to #new" do
      get("/user/mp_users/new").should route_to("user/mp_users#new")
    end

    it "routes to #show" do
      get("/user/mp_users/1").should route_to("user/mp_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user/mp_users/1/edit").should route_to("user/mp_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user/mp_users").should route_to("user/mp_users#create")
    end

    it "routes to #update" do
      put("/user/mp_users/1").should route_to("user/mp_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user/mp_users/1").should route_to("user/mp_users#destroy", :id => "1")
    end

  end
end
