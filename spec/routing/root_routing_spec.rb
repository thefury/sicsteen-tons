require "spec_helper"
require "rails_helper"

describe "root" do
  it "routes / to site controller" do
    expect(get: "/").to route_to(controller: "site", action: "client")
  end
end
