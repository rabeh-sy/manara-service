require "rails_helper"

RSpec.describe MosquesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mosques").to route_to("mosques#index")
    end

    it "routes to #new" do
      expect(get: "/mosques/new").to route_to("mosques#new")
    end

    it "routes to #show" do
      expect(get: "/mosques/1").to route_to("mosques#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mosques/1/edit").to route_to("mosques#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mosques").to route_to("mosques#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mosques/1").to route_to("mosques#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mosques/1").to route_to("mosques#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mosques/1").to route_to("mosques#destroy", id: "1")
    end
  end
end
