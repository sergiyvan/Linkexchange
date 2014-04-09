class API::V1::OutputsController < ApplicationController
	
	before_action :authenticate

	def get_partial
		puts params
		partial = Partial.order("RAND()").first
		respond_to do |format|
			format.json { render :json => partial.to_json }
			format.html { render :json => partial.to_json }
		end
	end
	
	private
	
		def authenticate
			render json: "Error, please contact support.", status: :unprocessable_entity if Customer.find(params[:id]).access_key != params[:access_key] 
		end

end