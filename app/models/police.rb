# == Schema Information
#
# Table name: police
#
#  id                    :integer          not null, primary key
#  complaint_id          :integer
#  status_report         :text(65535)
#  file                  :string(255)
#  date_asking_sr        :date
#  date_target_sr        :date
#  date_sr_filled        :date
#  summons               :text(65535)
#  fir_status            :boolean
#  fir_number            :string(255)
#  investigation_process :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  fir_date              :date
#
# Indexes
#
#  index_police_on_complaint_id  (complaint_id)
#

class Police < ActiveRecord::Base
	has_paper_trail
  include RailsAdminCharts

  validates_presence_of :complaint_id, :fir_number, :investigation_process
  #validates_presence_of :file

  extend Enumerize
  mount_uploader :file, FileUploader
  belongs_to :complaint

  rails_admin do 
  	list do
  		field :complaint
      field :status_report
      field :file
      field :date_asking_sr
      field :date_target_sr
      field :date_sr_filled
      field :summons
      field :fir_status
      field :fir_number
      field :fir_date
      field :investigation_process
  	end
  	show do
  		field :complaint
  		field :status_report
  		field :file
  		field :date_asking_sr
  		field :date_target_sr
  		field :date_sr_filled
  		field :summons
  		field :fir_status
  		field :fir_number
      field :fir_date
  		field :investigation_process
  	end
  	edit do
  		field :complaint
  		field :status_report
  		field :file
  		field :date_asking_sr
  		field :date_target_sr
  		field :date_sr_filled
  		field :summons
  		field :fir_status
  		field :fir_number
      field :fir_date
  		field :investigation_process
  	end
  end
end
