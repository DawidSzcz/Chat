class PostsController < ApplicationController

  def create
    @post = Post.new(params_permitted)
    @post.chat_room_id = params[:chat_room_id]
    @post.user_id = params[:user]
    if(@post.save)
      redirect_to chat_room_path(params[:chat_room_id])
    else
      render 'new'
    end
  end
  def params_permitted
    params.require(:post).permit(:content, :chat_room_id)
  end


end