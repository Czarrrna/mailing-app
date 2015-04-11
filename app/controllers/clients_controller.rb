class ClientsController < ApplicationController
	def index
		@clients = Client.all
	end

	def edit
		@client = Client.find params[:id]
	end

	def update
		@client = Client.find params[:id]
		if @client.update_attributes client_params
			redirect_to clients_path
		else
			render :action => :edit
		end
	end

	def show
		@client = Client.find params[:id]
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new client_params
		if @client.save
			redirect_to client_path(@client.id)
		else
			render :action => :new
		end
	end

	def destroy
		@client = Client.find params[:id]
		@client.destroy
		redirect_to clients_path
	end


	private
	def client_params
		params.require(:client).permit(:name, :surname, :email)
	end

 # POST /clients
  # POST /clients.json
  def create
    @Client = Client.new(params[:client])
 
    respond_to do |format|
      if @client.save
        # Tell the ClientMailer to send a welcome email after save
        ClientMailer.welcome_email(@client).deliver_later
 
        format.html { redirect_to(@client, notice: "client was successfully created.") }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end
end

class SendWeeklySummary
  def run
    Client.find_each do |client|
      ClientMailer.weekly_summary(user).deliver_now
    end
  end
end

end