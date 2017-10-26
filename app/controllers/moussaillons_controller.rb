class MoussaillonsController < ApplicationController

	def index
		@moussaillons = Moussaillon.all
	end

	def new
	end

	def create
		@moussaillon = Moussaillon.create(create_params)
		if @moussaillon.save
			redirect_to @moussaillon
		else
			render 'new'
		end
	end

	def show
		@moussaillon = Moussaillon.find(params[:id])
	end

	def edit
		@moussaillon = Moussaillon.find(params[:id])
	end

  def update
    @moussaillon = Moussaillon.find(params[:id])
 
    if @moussaillon.update(update_params)
      redirect_to @moussaillon
    else
      render 'edit'
    end
  end

	def destroy
	  @moussaillon = Moussaillon.find(params[:id])
	  @moussaillon.destroy
	  redirect_to moussaillons_path
	end

private

	def create_params
		params.permit(:username, :email)
	end

	def update_params
		params.permit(:username, :email, :bio)
	end

end
