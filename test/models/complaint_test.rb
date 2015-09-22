# == Schema Information
#
# Table name: complaints
#
#  id                :integer          not null, primary key
#  complainant       :string
#  respondent        :string
#  contact_number    :string
#  address           :string
#  area              :string
#  complaint_number  :string
#  target_date       :date
#  brief             :text
#  nature            :string
#  user_id           :integer
#  file              :string
#  registration_date :date
#  status            :string
#  prayers           :text
#  overdue           :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_complaints_on_user_id  (user_id)
#

require 'test_helper'

class ComplaintTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
