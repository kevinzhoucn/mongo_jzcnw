require "spec_helper"

describe QualifiesController do
  describe "routing" do

    it "routes to #index" do
      get("/qualifies").should route_to("qualifies#index")
    end

    it "routes to #new" do
      get("/qualifies/new").should route_to("qualifies#new")
    end

    it "routes to #show" do
      get("/qualifies/1").should route_to("qualifies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/qualifies/1/edit").should route_to("qualifies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/qualifies").should route_to("qualifies#create")
    end

    it "routes to #update" do
      put("/qualifies/1").should route_to("qualifies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/qualifies/1").should route_to("qualifies#destroy", :id => "1")
    end

  end
end
