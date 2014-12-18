require 'rails_helper'

RSpec.describe Api::V1::RequestsController, :type => :controller do
  describe "create" do
    context "successfully creates" do
      it "one request entry" do
        post :create, floor: "1"

        expect(Request.count).to eq(1)
      end

      it "and returns status 201" do
        post :create, floor: "1"

        expect(response.status).to eq(201)
      end
    end

    context "on failed creation" do
      it "doesn't change the count of objects" do
        post :create

        expect(Request.count).to eq(0)
      end

      it "returns a status 422" do
        post :create, floor: "22"

        expect(response.status).to eq(422)
      end
    end
  end
end
