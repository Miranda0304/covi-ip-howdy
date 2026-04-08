class ReportController < ApplicationController
  def index
    reports = Reports::CovidFindAll.new.call(params)
    render json: reports, status: :ok
  end
end
