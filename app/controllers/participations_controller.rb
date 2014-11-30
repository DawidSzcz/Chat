class ParticipationsController < ApplicationController

  def create
    # x = false
    # user = nil
    # User.all.each do |u|
    #   if u.email == params[:user]
    #     x = true
    #     user = u
    #     break
    #   end
    # end
    #
      @part = Participation.new
      user = User.find_by_email(params[:user])
      @part.user_id = user.present? ? user.id : nil
      @part.chat_room_id = params[:chat_room_id]
      @posts = ChatRoom.find(params[:chat_room_id]).posts
      @chat_room = ChatRoom.find(params[:chat_room_id])
      if @part.save
        redirect_to chat_room_path(params[:chat_room_id])
      else
        render 'chat_rooms/show'
      end
    end
end