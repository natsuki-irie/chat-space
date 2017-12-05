require 'rails_helper'

describe MessagesController do
let(:user) { create(:user) }
let(:group) { create(:group) }
let(:message) { create(:message) }

  describe 'GET #index' do
    context 'ログインしている場合' do
      before do
        login_user
        get :index, params:{group_id: group.id}
      end

      it "アクション内で定義しているインスタンス変数があるか" do
        expect(assigns(:group)).to eq group
      end

      it "該当するビューが描画されているか" do
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do
      before do
        get :index, params: {group_id: group.id}
      end

      it "新規登録画面にリダイレクトできているか" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do

    context 'ログインしているかつ、保存に成功した場合' do

      before do
        login_user
      end

      it "メッセージの保存はできたのか" do
        expect{
          post :create, params: {group_id: group, message: attributes_for(:message)}
        }.to change(Message, :count).by(1)

      end
      it "メッセージ保存後の画面に遷移しているか" do
        expect(
          post :create, params: {group_id: group, message: attributes_for(:message)}
          ).to redirect_to(group_messages_path)
      end

    end

    context 'ログインしているが、保存に失敗した場合' do

      before do
        login_user
      end

      it "メッセージの保存は行われなかったか" do
        expect{
          post :create, params: {group_id: group, message: attributes_for(:message)}
        }.to change(Message, :count).by(0)
      end
      it "メッセージ保存失敗後の画面に遷移されているか" do
        expect(
          post :create, params: {group_id: group, message: attributes_for(:message)}
          ).to redirect_to(group_messages_path)
      end
    end

    context 'ログインしていない場合' do
      it "新規登録画面にリダイレクトできているか" do
        post :create, params: { group_id: group, message: attributes_for(:message) }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end