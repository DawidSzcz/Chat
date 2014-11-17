class ParticipationsController < ApplicationController

  def create
    x = false
    user = nil
    User.all.each do |u|
      if u.email == params[:user]
        x = true
        user = u
        break
      end
    end
    if(x)
      @part = Participation.new
      @part.user_id = user.id
      @part.chat_room_id = params[:chat_room_id]
      @part.save
    end
    redirect_to chat_room_path(params[:chat_room_id])
  end


end