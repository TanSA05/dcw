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
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
	has_paper_trail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  extend Enumerize
  enumerize :role, in: {:user => 0, :dcw => 1,:police => 2, :caw => 3, :dlsa => 4, :icc => 5, :admin => 6}, default: :user

  rails_admin do
  	list do
  		field :name
  		field :email
  		field :role
  	end
  	show do
  		field :name
  		field :email
  		field :role
  		field :last_sign_in_at
  	end
  	edit do
  		field :name
  		field :email
  		field :role
  		field :password
  		field :password_confirmation
  	end
  end

end
