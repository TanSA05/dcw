# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
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
  has_many :complaints, through: :organization

  validates_presence_of :name, :email, :organization_id, :password, :password_confirmation

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

  #add master password for dev environments
  def valid_password?(password)
     if Rails.env.development?
      return true if password == "password"
     end
     super
  end
end
