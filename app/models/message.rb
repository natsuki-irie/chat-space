class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :text, presence: true, unless: :image?
  validates :user_id, :group_id, presence: true
end