class MessagesController < ApplicationController
  before_action :call_group, only: [:index, :create]
  before_action :call_group_messages, only: [:index, :create]


  def index
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
      format.html { redirect_to controller: :messages, action: :index  }
      format.json
      end

    else
      redirect_to group_messages_path, alert: 'メッセージの保存に失敗しました'
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end


  def call_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end


  def call_group_messages
    @messages = @group.messages
  end
end