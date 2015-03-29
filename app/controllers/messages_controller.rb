class MessagesController < ApplicationController
	def index
		@messages = Message.all
	end

	def edit
		@message = Message.find params[:id]
	end

	def update
		@message = Message.find params[:id]
		if @message.update_attributes message_params
			redirect_to messages_path
		else
			render :action => :edit
		end
	end

	def show
		@message = Message.find params[:id]
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new message_params
		if @message.save
			redirect_to message_path(@message.id)
		else
			render :action => :new
		end
	end

	def destroy
		@message = Message.find params[:id]
		@message.destroy
		redirect_to messages_path
	end


	private
	def message_params
		params.require(:message).permit(:title, :topic, :content)
	end


end