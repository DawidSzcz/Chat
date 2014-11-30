class PartValidator < ActiveModel::Validator
  def validate(record)
    if record.user_id == nil
      record.errors[:base] << "Wrong user"
    end
  end
end

class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_room
  validates_with PartValidator
  validates :user_id, uniqueness: true
end
