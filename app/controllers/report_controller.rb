class ReportController < ApplicationController
  def index
    reports = Reports::CovidFindAll.new.call
    render json: reports, status: :ok
  end
end
