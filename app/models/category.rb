# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
	has_paper_trail

	has_and_belongs_to_many :complaints

	validates :title, presence: true

	def to_s
		self.title
	end

	rails_admin do
		list do
			field :title
		end
		show do
			field :title
			field :complaints
		end
		edit do
			field :title
		end
	end
end
