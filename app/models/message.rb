class Message < ActiveRecord::Base
  belongs_to :user
  has_many :messages
  has_many :comments

  validates :message, :user, presence: true
  validates :message, length: { minimum: 10 }

  def self.with_comments
	everything = []
	messages = Message.joins(:user).select(:id, :message, :created_at, :username)
	messages.each do |m|
		everything << { message: m, comments: Comment.with_users(m.id) }
	end
	everything
  end
end
