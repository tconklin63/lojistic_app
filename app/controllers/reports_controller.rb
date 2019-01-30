class ReportsController < ApplicationController
  def index
    # Return only completed reports (filepath not nil)
    # that have not been deleted (deleted: false)
    @reports = Report.where(report_type: params[report_type],
                            deleted: false)
                     .where.not(filepath: nil)
  end

  def generate_report
    report_class = params[:report_type].camelize.constantize
    report = report_class.create(report_type: params[:report_type],
                                 start_date: params[:start_date],
                                 end_date: params[:end_date])
    # Generate report asynchronously
    ReportWorker.perform_async(report.id)
    redirect_to :reports
  end

  def delete_report
    # Delete is a soft delete
    Report.find(params[:report_id]).update_attribute(deleted: true)
    redirect_to :reports
  end
end
