# == Schema Information
#
# Table name: forwards
#
#  id                   :integer          not null, primary key
#  complaint_id         :integer
#  organization_id      :integer
#  reply_attachment     :string(255)
#  interim_remarks      :text(65535)
#  final_remarks        :text(65535)
#  feedback_agency      :text(65535)
#  feedback_dcw         :text(65535)
#  call_center_feedback :text(65535)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_forwards_on_complaint_id     (complaint_id)
#  index_forwards_on_organization_id  (organization_id)
#

require 'test_helper'

class ForwardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
