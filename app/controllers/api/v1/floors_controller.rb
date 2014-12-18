class Api::V1::FloorsController < ApplicationController
  respond_to :json
  
  def index
    floors_with_active_requests = Request.active_by_floor
    response = format_floors_for_api(floors_with_active_requests).compact
    respond_to do |format|
      format.json {render json: response, status: 200}
    end
  end

  def destroy
    # untested!!!!!!!!!!!
    floor = params[:id]
    Request.where(floor: floor).update_all(deleted: true)

    render nothing: true, status: 200
  end

  private
  def format_floors_for_api requests_by_floor
    requests_by_floor.map do |floor|
      {floor: floor[0].floor, oldest: floor[0].created_at, newest: floor[-1].created_at, count: floor.length} unless floor.blank?
    end
  end
end
