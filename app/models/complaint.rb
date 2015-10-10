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

class Complaint < ActiveRecord::Base
	has_paper_trail
  include RailsAdminCharts

  extend Enumerize
  enumerize :status, in: ["Status 1", "Status 2", "Status 3", "Status 4"]
  enumerize :area, in: ["Area 1", "Area 2", "Area 3", "Area 4"]
  enumerize :nature, in: ["Nature1", "Nature2", "Nature3", "Nature4"]
  enumerize :category, in: ["category 1", "category 2", "category 3"]

  mount_uploader :file, FileUploader

  has_many :hearings

  before_create do
    if(Complaint.last)
      #complaint_count = Complaint.last.complaint_count + 1
      complaint_year = Time.now.year.to_s.last(2).to_i
      complaint_last_year = Complaint.last.complaint_number.scan(/\d/)[0,2].join.to_i
      #puts "Last year is #{complaint_last_year}"
      complaint_month = Time.now.strftime("%m").to_i
      complaint_last_month = Complaint.last.complaint_number.scan(/\d/)[2,2].join.to_i
      #puts "Last month is #{complaint_last_month}"
      if((complaint_year == complaint_last_year) and (complaint_month == complaint_last_month))
        count = Complaint.last.complaint_number.last(5).to_i+1
        str_count = format('%05d',count)
        self.complaint_number = Time.now.year.to_s.last(2) + Time.now.strftime("%m").to_s + str_count
      else
        self.complaint_number = Time.now.year.to_s.last(2) + Time.now.strftime("%m").to_s + "00001".to_s
      end
    else
      self.complaint_number = Time.now.year.to_s.last(2) + Time.now.strftime("%m").to_s + "00001".to_s
    end
  end

  rails_admin do
  	list do
  		field :complaint_number
      field :complainant
      field :respondent_if_person
      field :respondent_if_agency
      field :contact_number
      field :area
      field :nature
      field :category
      field :target_date
      field :registration_date
      field :status
      field :overdue
  	end
  	show do
  		field :complaint_number
      field :complainant
      field :respondent_if_person
      field :respondent_if_agency
      field :contact_number
      field :address
      field :area
      field :nature
      field :brief
      field :prayers
      field :file
      field :registration_date
      field :target_date
      field :status
      field :overdue
			field :category
      field :hearings
      field :created_at
      field :updated_at
  	end
  	edit do
      field :complaint_number
      field :complainant
      field :respondent_if_person
      field :respondent_if_agency
      field :contact_number
      field :address
      field :area
      field :nature
      field :brief
      field :prayers
      field :file
      field :registration_date
      field :target_date
      field :status
      field :overdue
      field :category
  	end
  end
end
