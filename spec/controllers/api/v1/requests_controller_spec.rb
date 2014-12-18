require 'rails_helper'

RSpec.describe Api::V1::RequestsController, :type => :controller do
  
  describe "index" do
    
    it "should render an array of requests" do
      request_1 = Request.create floor: 1

      get :index
      result = JSON.parse response.body
      
      expect(result[0]['id']).to be(request_1.id)
    end

    it "should render only active requests" do
      request_1 = Request.create floor: 1
      request_2 = Request.create floor: 2, deleted: true

      get :index
      result = JSON.parse response.body
      
      expect(result.map{|i| i['id'] }).to_not include(request_2.id)
    end

  end

end
