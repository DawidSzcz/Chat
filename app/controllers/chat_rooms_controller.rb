class ChatRoomsController < ApplicationController

  def show
    @posts = ChatRoom.find(params[:id]).posts
    @post = Post.new
    @chat_room = ChatRoom.find(params[:id])
    @part = Participation.new
  end
  def index
    @chat_rooms = allowed(current_user)
  end
  def new
    @chat_room =ChatRoom.new
  end
  def create
    @chat_room = ChatRoom.new(params_permited)
    @chat_room.user_id = params[:user]
    @part = Participation.new
    @part.user_id = params[:user]

    if @chat_room.save
      @part.chat_room_id = @chat_room.id
      @part.save
      redirect_to @chat_room
    else
      render 'new'
    end
  end
  def add_participant
    render plain: "siis"
  end
  def params_permited
    params.require(:chat_room).permit(:name, :publicity, :owner)
  end

  private
  def allowed(user)
    zwrot = []
    ChatRoom.all.each do |c|
      if(c.publicity || c.users.include?(user))
        zwrot << c
      end
    end
    return zwrot
  end

end
