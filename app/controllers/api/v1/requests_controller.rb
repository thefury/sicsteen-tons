class Api::V1::RequestsController < ApplicationController
  respond_to :json

  def index
    @requests = Request.active
    render json: @requests
  end

  def destroy
    render json: {}
  end
end
