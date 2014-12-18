require 'rails_helper'

RSpec.describe Api::V1::RequestsController, :type => :controller do
  
  describe "index" do
    
    it "should render an array of requests" do
      request_1 = Request.create floor: "1"

      get :index
      result = JSON.parse response.body
      
      expect(result[0]['id']).to be(request_1.id)
    end

    it "should render only active requests" do
      request_1 = Request.create floor: "1"
      request_2 = Request.create floor: "2", deleted: true

      get :index
      result = JSON.parse response.body
      
      expect(result.map{|i| i['id'] }).to_not include(request_2.id)
    end

  end

  describe "destroy" do
    
    it "should destroy a request" do
      request = Request.create floor: "1"

      delete :destroy, id: request.id
      
      expect(Request.find(request.id).deleted).to be true
    end

    it "should return 200 on successful deletion" do
      request = Request.create floor: "1"

      delete :destroy, id: request.id
      
      expect(response).to have_http_status 200
    end

    it "should return 422 on unsuccessful deletion" do
      request = Request.create floor: "1"
      Request.any_instance.stub(:update_attributes).and_return false

      delete :destroy, id: request.id
      
      expect(response).to have_http_status 422
    end

  end

end
