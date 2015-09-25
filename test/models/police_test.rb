# == Schema Information
#
# Table name: police
#
#  id                    :integer          not null, primary key
#  complaint_id          :integer
#  status_report         :text(65535)
#  file                  :string(255)
#  date_asking_sr        :date
#  date_target_sr        :date
#  date_sr_filled        :date
#  summons               :text(65535)
#  fir_status            :boolean
#  fir_number            :string(255)
#  investigation_process :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_police_on_complaint_id  (complaint_id)
#

require 'test_helper'

class PoliceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
