class GossipsController < ApplicationController

	def index
		@gossips = Gossip.all

	end

	def new
	end

	def create
		@moussaillon = Moussaillon.find(params[:moussaillon_id])
		@gossip = @moussaillon.gossips.create(gossip_params)
   
		if @gossip.save
			redirect_to moussaillon_gossip_path(@moussaillon, :id)
		else
			render 'new'
		end
	end

	def show
		@moussaillon = Moussaillon.find(params[:moussaillon_id])
	end


private
	
	def gossip_params
		params.permit(:body, :moussaillon_id)
		
	end

end
