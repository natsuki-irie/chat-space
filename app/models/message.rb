class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  mount_uploader :image, ImageUploader
  validates :text, presence: true
end
 # / .chat-bottom-view
 #      / .user-action__box 
 #      / %input{placeholder: "type a message", type: "text", class: "bottom_text"}/
 #      / .fa.fa-picture-o.user-action__box__image
 #      / %button{name: "action", type: "submit", value: "send"} Send


 #      / .chat-top-view__text1 sampleメッセージ
 #      / .chat-top-view__text2 konnnitiwawawak

 #    .chat-center-view
 #      .chat-center-view__space1
 #    / .chat-center-view__text1 ryousukemaehira
 #    / .chat-center-view__text2 2017/11/10 16:26:07
 #    / .chat-center-view__text3 なるほど
 #    / .chat-center-view__space2
 #    / .chat-center-view__text4 irie natsuki
 #    / .chat-center-view__text5 2018/08/21 18:45:33
 #    / .chat-center-view__text6 レビューお願いします

 #    .chat-top-view
 #    .chat-top-view__text
 #    =link_to edit_group_path(current_user), class: "edit" do
 #    %button.edit{type: "submit"} Edit