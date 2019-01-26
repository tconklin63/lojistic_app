# frozen_string_literal: true

# == Schema Information
#
# Table name: packages
#
#  id                     :integer          not null, primary key
#  invoice_id             :integer
#  tracking_number        :string
#  service_name           :string
#  ship_date              :date
#  delivery_date          :date
#  expected_delivery_date :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class Package < ApplicationRecord
  belongs_to :invoice
end
