# == Schema Information
#
# Table name: hearings
#
#  id                            :integer          not null, primary key
#  complaint_id                  :integer
#  complainant_present           :boolean
#  other_summoned                :string(255)
#  other_present                 :boolean
#  remarks                       :text(65535)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  date                          :date
#  respondent_summoned_if_person :boolean
#  respondent_summoned_if_agency :boolean
#  respondent_present_if_person  :boolean
#  respondent_present_if_agency  :boolean
#  complainant_called            :string(255)
#
# Indexes
#
#  index_hearings_on_complaint_id  (complaint_id)
#

class Hearing < ActiveRecord::Base
	has_paper_trail
  include RailsAdminCharts

  extend Enumerize

  belongs_to :complaint

  rails_admin do
  	list do
  		field :complaint
  		field :date
      field :complainant_called
      field :complainant_present
      field :respondent_summoned_if_person
      field :respondent_summoned_if_agency
      field :respondent_present_if_person
      field :respondent_present_if_agency
      field :other_summoned
      field :other_present
  	end
  	show do
  		field :complaint
  		field :date
  		field :complainant_called
  		field :complainant_present
  		field :respondent_summoned_if_person
      field :respondent_summoned_if_agency
  		field :respondent_present_if_person
      field :respondent_present_if_agency
  		field :other_summoned
  		field :other_present
  		field :remarks
  	end
  	edit do
  		field :complaint
  		field :date
  		field :complainant_called
  		field :complainant_present
  		field :respondent_summoned_if_person
      field :respondent_summoned_if_agency
      field :respondent_present_if_person
      field :respondent_present_if_agency
  		field :other_summoned
  		field :other_present
  		field :remarks
  	end
  end
end
