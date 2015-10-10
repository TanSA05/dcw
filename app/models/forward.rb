# == Schema Information
#
# Table name: forwards
#
#  id                   :integer          not null, primary key
#  complaint_id         :integer
#  organization_id      :integer
#  user_id              :integer
#  reply_attachment     :string(255)
#  interim_remarks      :text(65535)
#  final_remarks        :text(65535)
#  feedback_agency      :text(65535)
#  feedback_dcw         :text(65535)
#  call_center_feedback :text(65535)
#  date_forwarding      :date
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_forwards_on_complaint_id     (complaint_id)
#  index_forwards_on_organization_id  (organization_id)
#  index_forwards_on_user_id          (user_id)
#

class Forward < ActiveRecord::Base
	has_paper_trail
  include RailsAdminCharts

  validates_presence_of :complaint_id, :organization_id, :user_id
  #validates_presence_of :reply_attachment

  extend Enumerize
  mount_uploader :reply_attachment, FileUploader

  belongs_to :complaint
  belongs_to :organization
  belongs_to :user

  before_create do
    self.date_forwarding = Time.now.to_s
  end

  rails_admin do
  	list do
  		field :complaint
  		field :organization
  		field :date_forwarding
  	end
  	show do
  		field :complaint
  		field :organization
  		field :user
  		field :reply_attachment
  		field :interim_remarks
  		field :final_remarks
  		field :feedback_dcw
  		field :feedback_agency
  		field :call_center_feedback
  		field :date_forwarding
  	end
  	edit do
  		field :complaint do
        help do
          nil
        end
      end
  		field :organization do
        help do
          nil
        end
      end
  		field :user do
        help do
          "Enter User forwarding complaint"
        end
      end
  		field :reply_attachment do
        help do
          "Upload file containing reply"
        end
      end
  		field :interim_remarks do
        help do
          "Enter interim remarks"
        end
      end
  		field :final_remarks do
        help do
          "Enter final remarks"
        end
      end
  		field :feedback_dcw do
        help do
          nil
        end
      end
  		field :feedback_agency do
        help do
          nil
        end
      end
  		field :call_center_feedback do
        help do
          nil
        end
      end
  		field :date_forwarding do
        help do
          "Date of forwarding complaint"
        end
      end
  	end
  end
end
