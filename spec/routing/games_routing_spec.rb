require 'rails_helper'

RSpec.describe "Routing to games", :type => :routing do
  it "routes GET /games to games#index" do
    expect(get: "/games").to route_to("games#index")
  end

  it "routes GET /games/1 to games#show" do
    expect(get: "/games/1").to route_to("games#show", id: "1")
  end
end
