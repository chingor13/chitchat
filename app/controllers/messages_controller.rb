class MessagesController < ApplicationController
  include ActionController::Live
  
  # GET /chats/:id/messages
  def index
    # SSE expects the `text/event-stream` content type
    response.headers['Content-Type'] = 'text/event-stream'
    
    chat = Chitchat::Chat.find(params[:chat_id])
    last_message_id = nil
    
    begin
      loop do
        scope = Chitchat::Message.where(chat_id: chat.id)
        scope = scope.where(['id > ?', last_message_id]) if last_message_id

        messages = nil
        
        ActiveRecord::Base.uncached do
          messages = scope.all
        end
        
        if messages.present?
          response.stream.write "data: #{messages.to_json}\n\n"
          last_message_id = messages.last.id
        end
    
        sleep 1
      end
    rescue IOError
      # When the client disconnects, we'll get an IOError on write
    ensure
      response.stream.close
    end
  end

  # POST /chats/:id/messages
  def create
    chat = Chitchat::Chat.find(params[:chat_id])
    
    user = Chitchat::User.find_by_identifier(params[:from])
    
    @message = chat.messages.build(user: user, body: params[:body])
    if @message.save
      render json: {status: 200, message: @message}
    else
      render json: {status: 422, errors: @message.errors.full_messages}
    end
  end

end
