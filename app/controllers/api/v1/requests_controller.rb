class Api::V1::RequestsController < ApplicationController
  respond_to :json

  def index
    @requests = Request.active
    render json: @requests
  end

  def destroy
    render json: {}
  end

  def create
    request = Request.new(floor: params[:floor])
    if request.save
      render nothing: true, status: 201
    else
      render nothing: true, status: 422
    end
  end
end
