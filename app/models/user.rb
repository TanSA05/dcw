# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  role                   :integer
#  organization_id        :integer
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_organization_id       (organization_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
	has_paper_trail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :organization

  extend Enumerize
  enumerize :role, in: {:user => 0, :admin => 1}, default: :user

  validates :name, presence: true
  validates :role, presence: true
  validates :organization, presence: true

  rails_admin do
  	list do
  		field :name
  		field :email
  		field :organization
  	end
  	show do
  		field :name
  		field :email
  		field :organization
  		field :last_sign_in_at
  	end
  	edit do
  		field :name
  		field :email
  		field :organization
  		field :password
  		field :password_confirmation
  	end
  end

end
