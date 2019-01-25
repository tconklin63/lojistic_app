class InitialTables < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :type
      t.datetime :invoice_date
      t.integer :invoice_amount
      t.string :reference_number

      t.timestamps
    end

    create_table :packages do |t|
      t.integer :invoice_id
      t.string :tracking_number
      t.string :service_name
      t.date :ship_date
      t.date :delivery_date
      t.date :expected_delivery_date

      t.timestamps
    end

    add_foreign_key :packages, :invoices, on_delete: :cascade
  end
end
