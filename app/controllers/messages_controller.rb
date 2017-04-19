class MessagesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @messages = Message.with_comments
  end

  def create
    @user = User.find(session[:user_id])
    @message = @user.messages.new(message_params)

    if @message.save
      redirect_to '/messages'
    else
      flash[:errors] = @message.errors.full_messages
      redirect_to '/messages'
    end
  end

private
    def message_params
       params.require(:message).permit(:message)
    end
end
