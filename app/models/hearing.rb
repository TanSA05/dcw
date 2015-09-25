# == Schema Information
#
# Table name: hearings
#
#  id                   :integer          not null, primary key
#  complaint_id         :integer
#  complainant_summoned :boolean
#  respondent_summoned  :boolean
#  complainant_present  :boolean
#  respondent_present   :boolean
#  other_summoned       :string(255)
#  other_present        :boolean
#  remarks              :text(65535)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_hearings_on_complaint_id  (complaint_id)
#

class Hearing < ActiveRecord::Base
  belongs_to :complaint
end
