class GroupsController < ApplicationController
  before_action :set_group, only: [:index, :edit, :update]

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render "new"
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを編集しました'
    else
      render "edit"
    end
  end

  def show
  end

  def chat
    @message = Message.all
  end

  private

  def set_group
    @group = Group.find_by(params[:id])
    # @group = Group.find(params[:id])
    @groups = current_user.groups
  end


  def group_params
      params.require(:group).permit(:name, { user_ids: [] })
  end

end

