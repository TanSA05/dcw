# == Schema Information
#
# Table name: forwards
#
#  id                   :integer          not null, primary key
#  complaint_id         :integer
#  organization_id      :integer
#  user_id              :integer
#  reply_attachment     :string(255)
#  interim_remarks      :text(65535)
#  final_remarks        :text(65535)
#  feedback_agency      :text(65535)
#  feedback_dcw         :text(65535)
#  call_center_feedback :text(65535)
#  date_forwarding      :date
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_forwards_on_complaint_id     (complaint_id)
#  index_forwards_on_organization_id  (organization_id)
#  index_forwards_on_user_id          (user_id)
#

class Forward < ActiveRecord::Base
	has_paper_trail

  extend Enumerize

  belongs_to :complaint
  belongs_to :organization
  belongs_to :user
end
