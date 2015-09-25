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
#  date                 :date
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
  	end
  	show do
  		field :complaint
  		field :date
  		field :complainant_summoned
  		field :complainant_present
  		field :respondent_summoned
  		field :respondent_present
  		field :other_summoned
  		field :other_present
  		field :remarks
  	end
  	edit do
  		field :complaint
  		field :date
  		field :complainant_summoned
  		field :complainant_present
  		field :respondent_summoned
  		field :respondent_present
  		field :other_summoned
  		field :other_present
  		field :remarks
  	end
  end
end
