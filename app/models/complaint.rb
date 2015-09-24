# == Schema Information
#
# Table name: complaints
#
#  id                :integer          not null, primary key
#  complainant       :string(255)
#  respondent        :string(255)
#  contact_number    :string(255)
#  address           :string(255)
#  area              :string(255)
#  complaint_number  :string(255)
#  target_date       :date
#  brief             :text(65535)
#  nature            :string(255)
#  user_id           :integer
#  file              :string(255)
#  registration_date :date
#  status            :string(255)
#  prayers           :text(65535)
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
	has_and_belongs_to_many :categories

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
			field :categories do
        searchable :title
      end

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
			field :categories
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
			field :categories
  	end
  end
end
