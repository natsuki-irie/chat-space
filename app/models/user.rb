class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, presence: true
  validates :email, presence: true
  has_many :group_users, foreign_key: 'user_id'
  has_many :groups, through: :group_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
