require 'rails_helper'
describe Message do
  describe '#create' do
    let(:user) { create(:user) }
    let(:image_path) { File.join(Rails.root, 'spec/fixtures/files/tech.jpg') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
  # メッセージと画像があれば保存できる
    it "is valid with text and image" do
      message = build(:message)
      expect(message).to be_valid
    end
  # メッセージがあれば保存できる
    it "is valid only text" do
      message = build(:message, image: nil)
      expect(message).to be_valid
    end
  # 画像があれば保存できる
    it "is valid only image" do
      message = build(:message, text: nil)
      expect(message).to be_valid
    end


  # メッセージと画像がなければ保存できない
    it "is invalid without both text and image" do
      message = build(:message,
                      text:     nil,
                      image:    nil)
      message.valid?
      expect(message.errors[:text]).to include("を入力してください")
    end
  # group_idがないと保存できない
    it "is invalid without group_id" do
      message = build(:message,
                      group_id:     nil)
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end
  # user_idがないと保存できない
    it "is invalid without user_id" do
      message = build(:message,
                      user_id:     nil)
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end
  end
end