class PrivateChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    # @rooms = Room.public_rooms
    @rooms = Room.private_rooms 
    @users = Participant.people(@rooms, current_user)
    
    if @users.empty?
      @users = []
      @users << @user
    end
    # @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, @current_user], @room_name)
    @messages = @single_room.messages

    render "rooms/index"
  end

  private
  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end

  def check_user
    if current_user.id != params[:id].to_i
      redirect_to account_root_path, alert: "Acesso negado"
    end
  end
end