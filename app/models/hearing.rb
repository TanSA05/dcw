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

  validates_presence_of :complaint_id

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
  		field :complaint do
        help do
          nil
        end
      end
  		field :date do
        help do
          nil
        end
      end
  		field :complainant_called do
        help do
          "Tick if called"
        end
      end
  		field :complainant_present do
        help do
          "Tick if present"
        end
      end
  		field :respondent_summoned_if_person do
        help do
          "Tick if person summoned"
        end
      end
      field :respondent_summoned_if_agency do
        help do
          "Tick if agency summoned"
        end
      end
      field :respondent_present_if_person do
        help do
          "Tick if person present"
        end
      end
      field :respondent_present_if_agency do
        help do
          "Tick if respondent present"
        end
      end
  		field :other_summoned do
        help do
          nil
        end
      end
  		field :other_present do
        help do
          nil
        end
      end
  		field :remarks do
        help do
          nil
        end
      end
  	end
  end
end
