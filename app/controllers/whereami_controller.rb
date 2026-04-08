class WhereamiController < ApplicationController
  def index
    location = Api::IpLocation.new(ip: params[:ip]).call
    render json: location, status: :ok
  end
end
