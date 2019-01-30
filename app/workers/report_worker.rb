class ReportWorker
  include Sidekiq::Worker

  def perform(report_id)
    Report.find(report_id).generate
  end
end
