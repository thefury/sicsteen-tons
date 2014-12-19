class Api::V1::FloorsController < ApplicationController
  respond_to :json

  def index
    response = format_floors_for_api.reverse
    respond_to do |format|
      format.json {render json: response, status: 200}
    end
  end

  def destroy
    floor = params[:id]
    Request.where(floor: floor).update_all(deleted: true)

    render nothing: true, status: 200
  end

  private
  def format_floors_for_api
     Request.floors.map do |floor|
      requests = Request.active_for_floor floor
      if requests.present?
        {floor: floor, oldest: requests[0].created_at, newest: requests[-1].created_at, count: requests.length}
      else
        {floor: floor, count: 0}
      end
    end
  end
end
