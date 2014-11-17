class Post < ActiveRecord::Base
  belongs_to :chat_room
  belongs_to :user
end
