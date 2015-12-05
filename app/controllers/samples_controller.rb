class SamplesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	
	def index
		@samples = Sample.all
	end

	def new
		@sample = Sample.new
	end

	def show
		@sample = Sample.find(params[:id])
	end

	def create
		@sample = Sample.new(sample_params)

		if @sample.save
			redirect_to samples_url, notice: 'Sample created'
		else
			render :new
		end
	end

	def update
		@sample = Sample.find(params[:id])

		if @sample.update(post_params)
			redirect_to samples_url, notice: 'Post Updated'
		else
			render :edit
		end
	end

	def destroy
		@sample = Sample.find(params[:id])
		@sample.destroy
		redirect_to samples_url, notice: 'Sample deleted successfully'
	end

	private

	def sample_params
		params.require(:sample).permit(:name, :link, :description)
	end

end
