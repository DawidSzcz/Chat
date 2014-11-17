class ChatRoom < ActiveRecord::Base
  validates :name, presence: true,
            length: { minimum: 5 }
  has_many :posts, dependent: :destroy
  has_many :participations
  has_many :users, through: :participations
  belongs_to :user
end
