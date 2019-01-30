# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id          :integer          not null, primary key
#  start_date  :date
#  end_date    :date
#  filepath    :string
#  report_type :string
#  deleted     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class InvoiceSummaryReport < Report

  def generate
    invoices = Invoice.includes(:packages)
                      .where(invoice_date:
                             Date.parse(start_date)..Date.parse(end_date))
                      .order(invoice_date: :asc)
    results = []
    headers = ['Invoice Type',
               'Invoice Date',
               'Invoice Amount',
               'Invoice Reference Number',
               'Number of Packages',
               'Unique Serivces']
    filename = File.join('reports',
                         report_type,
                         "#{start_date}_#{end_date}_#{self.class.underscore}")
    CSV.open(filename, "wb") do |csv|
      csv << headers
      invoices.each do |invoice|
        csv << [ invoice.type,
                     invoice.invoice_date.to_s,
                     invoice.invoice_amount,
                     invoice.invoice_reference_number,
                     invoice.packages.count,
                     invoice.packagers.uniq(:service_name)
                   ]
      end
    end
    self.filepath = filename
    self.save # save filepath to DB
  end
end
