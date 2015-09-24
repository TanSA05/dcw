# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ActiveRecord::Base
	has_paper_trail

	has_many :users

  extend Enumerize
  enumerize :category, in: {:dcw => 0, :police => 1, :others => 2}, default: :dcw

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  rails_admin do
  	list do
  		field :name
  		field :category
  	end
  	show do
  		field :name
  		field :category
  		field :users
  	end
  	edit do
  		field :name
  		field :category
  	end
  end
end
