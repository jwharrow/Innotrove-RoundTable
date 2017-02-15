require 'rails_helper'

RSpec.describe "Routing to the application", :type => :routing do
  it "routes GET / to application#index" do
    expect(get: "/").to route_to("application#index")
  end
end
