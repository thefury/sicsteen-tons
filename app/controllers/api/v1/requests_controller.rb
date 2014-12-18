class Api::V1::RequestsController < ApplicationController
  respond_to :json

  def index
    render json: {}
  end

end
