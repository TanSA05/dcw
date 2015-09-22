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

class Complaint < ActiveRecord::Base
	has_paper_trail

  belongs_to :user

  extend Enumerize
  enumerize :status, in: ["Status 1", "Status 2", "Status 3", "Status 4"]
  enumerize :area, in: ["Area 1", "Area 2", "Area 3", "Area 4"]
  enumerize :nature, in: ["Nature1", "Nature2", "Nature3", "Nature4"]

  mount_uploader :file, FileUploader


  rails_admin do
  	list do
  		field :complainant
  		field :respondent
  		field :contact_number
  		field :address
  		field :area
  		field :complaint_number
  		field :target_date
  		field :status
  		field :overdue
  		field :brief
  		field :prayers
  		field :nature
  		field :user
  		field :file
  		field :registration_date

  	end
  	show do
  		field :complainant
  		field :respondent
  		field :contact_number
  		field :address
  		field :area
  		field :complaint_number
  		field :target_date
  		field :status
  		field :overdue
  		field :brief
  		field :prayers
  		field :nature
  		field :user
  		field :file
  		field :registration_date
  	end
  	edit do
  		field :complainant
  		field :respondent
  		field :contact_number
  		field :address
  		field :area
  		field :complaint_number
  		field :target_date
  		field :status
  		field :overdue
  		field :brief
  		field :prayers
  		field :nature
  		field :user
  		field :file
  		field :registration_date
  	end
  end
end
