require 'rails_helper'

RSpec.describe Api::V1::FloorsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index, format: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

   describe 'index' do
    let!(:request1) { Request.create floor: "1" }
    let!(:request2) { Request.create floor: "1" }
    let!(:request3) { Request.create floor: "2" }
    let!(:request4) { Request.create floor: "2", deleted: true }

    it "should return a json object all floors" do
      get :index, format: :json
      floors = JSON.parse(response.body).map{|floor| floor['floor']}
      expect(floors).to eq ['5', '4','3', '2', '1', 'b']
    end

    xit "should return a json object with the first created active request in :oldest" do
      #timecop needed
      get :index, format: :json
      floors = JSON.parse(response.body)
      binding.pry
      expect(floors[1]["oldest"].to_time).to eq request1.created_at.to_time
    end
    xit "should return a json object with the most recently created active request in :newest" do
      #timecop needed
    end

    it 'should return the number of active requests for each floor' do
      get :index, format: :json
      floors = JSON.parse(response.body).map{|floor| floor['count']}
      expect(floors).to eq [0,0,0,1,2,0]

    end
  end

end
