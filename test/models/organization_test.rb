# == Schema Information
#
# Table name: organizations
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  category                :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  days_for_final_response :integer
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
