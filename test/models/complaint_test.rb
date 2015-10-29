# == Schema Information
#
# Table name: complaints
#
#  id                            :integer          not null, primary key
#  complainant                   :string(255)
#  address                       :string(255)
#  complaint_number              :string(255)
#  final_target_date             :date
#  file                          :string(255)
#  status                        :string(255)
#  prayers                       :text(65535)
#  overdue                       :boolean
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  category                      :string(255)
#  respondent_if_person          :string(255)
#  respondent_if_agency          :string(255)
#  brief_of_complaint            :text(65535)
#  contact_number_of_complainant :string(255)
#  locality                      :string(255)
#  next_target_date              :date
#  organization_id               :integer
#
# Indexes
#
#  index_complaints_on_organization_id  (organization_id)
#

require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
