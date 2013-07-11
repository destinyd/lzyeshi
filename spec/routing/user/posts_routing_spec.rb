require "spec_helper"

describe User::PostsController do
  describe "routing" do

    it "routes to #index" do
      get("/user/posts").should route_to("user/posts#index")
    end

    it "routes to #new" do
      get("/user/posts/new").should route_to("user/posts#new")
    end

    it "routes to #show" do
      get("/user/posts/1").should route_to("user/posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user/posts/1/edit").should route_to("user/posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user/posts").should route_to("user/posts#create")
    end

    it "routes to #update" do
      put("/user/posts/1").should route_to("user/posts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user/posts/1").should route_to("user/posts#destroy", :id => "1")
    end

  end
end
