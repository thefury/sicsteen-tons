class Api::V1::RequestsController < ApplicationController
  respond_to :json

  def index
    @requests = Request.active
    render json: @requests
  end

  def destroy
    @request = Request.find(params[:id])
    if @request.update_attributes deleted: true
      render nothing: true, status: 200
    else
      render nothing: true, status: 422
    end
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
