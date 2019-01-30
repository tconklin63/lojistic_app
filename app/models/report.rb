# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  start_date :date
#  end_date   :date
#  filepath   :string
#  deleted    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
  def generate
    raise NotImplementedError, 'Reports must implement a generate method'
  end
end
