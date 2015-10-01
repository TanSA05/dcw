# == Schema Information
#
# Table name: complaints
#
#  id                   :integer          not null, primary key
#  complainant          :string(255)
#  contact_number       :string(255)
#  address              :string(255)
#  area                 :string(255)
#  complaint_number     :string(255)
#  target_date          :date
#  brief                :text(65535)
#  nature               :string(255)
#  file                 :string(255)
#  registration_date    :date
#  status               :string(255)
#  prayers              :text(65535)
#  overdue              :boolean
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  category             :string(255)
#  respondent_if_person :string(255)
#  respondent_if_agency :string(255)
#

require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
