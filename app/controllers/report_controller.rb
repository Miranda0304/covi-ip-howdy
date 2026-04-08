class ReportController < ApplicationController
  def index
    reports = Reports::CovidFindAll.new.call(params)
    render json: reports, status: :ok
  end

  def create
    report = Reports::CovidCreate.new.call(report_params)
    render json: report, status: :created
  end

  private

  def report_params
    params.permit(:name,
                  :gender,
                  :age,
                  :city,
                  :state,
                  :country,
                  :date,
                  :latitude,
                  :longitude)
  end
end
