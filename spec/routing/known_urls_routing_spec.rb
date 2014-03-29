require "spec_helper"

describe KnownUrlsController do
  describe "routing" do

    it "routes to #index" do
      get("/known_urls").should route_to("known_urls#index")
    end

    it "routes to #new" do
      get("/known_urls/new").should route_to("known_urls#new")
    end

    it "routes to #show" do
      get("/known_urls/1").should route_to("known_urls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/known_urls/1/edit").should route_to("known_urls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/known_urls").should route_to("known_urls#create")
    end

    it "routes to #update" do
      put("/known_urls/1").should route_to("known_urls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/known_urls/1").should route_to("known_urls#destroy", :id => "1")
    end

  end
end
