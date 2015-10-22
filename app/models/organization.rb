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
  include RailsAdminCharts

	has_many :users

  extend Enumerize
  enumerize :category, in: {:dcw => 0, :police => 1, :others => 2}, default: :dcw

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true

  def to_s
    self.name
  end

  def title
    self.name
  end

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
  def self.graph_data since=30.days.ago
    [
      {
          name: 'All Organization',
          pointInterval: point_interval = 1.day * 1000,
          pointStart: start_point = since.to_i * 1000,
          data: self.all.delta_records_since(since)
      },
      {
          name: 'Others',
          pointInterval: point_interval,
          pointStart: start_point,
          data: self.where(category: 2).delta_records_since(since)
      }
    ]
  end
end
