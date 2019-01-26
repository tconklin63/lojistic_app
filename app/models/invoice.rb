# frozen_string_literal: true

# == Schema Information
#
# Table name: invoices
#
#  id               :integer          not null, primary key
#  type             :string
#  invoice_date     :datetime
#  invoice_amount   :integer
#  reference_number :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Invoice < ApplicationRecord
  has_many :packages
end
