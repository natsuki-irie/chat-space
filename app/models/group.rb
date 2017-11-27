class Group < ApplicationRecord
  has_many :group_users, foreign_key: 'group_id'
  has_many :users, through: :group_users
  has_many :messages

  validates :name, presence: true
  accepts_nested_attributes_for :group_users
end
