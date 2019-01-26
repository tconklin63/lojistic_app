class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.date start_invoice_date
      t.date end_invoice_date
      t.string filepath

      t.timestamps
    end
  end
end
