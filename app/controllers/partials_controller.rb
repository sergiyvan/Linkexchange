class PartialsController < ApplicationController
  before_action :set_partial, only: [:show, :edit, :update, :destroy]

  def generate
	1000.times do
		Partial.generate_random_partial
	end
	render action: 'index'
  end

  def index
    @partials = Partial.all
  end

  def show
  end

  def new
    @partial = Partial.new
  end

  def edit
  end

  def create
    @partial = Partial.new(partial_params)

    respond_to do |format|
      if @partial.save
        format.html { redirect_to @partial, notice: 'Partial was successfully created.' }
        format.json { render action: 'show', status: :created, location: @partial }
      else
        format.html { render action: 'new' }
        format.json { render json: @partial.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @partial.update(partial_params)
        format.html { redirect_to @partial, notice: 'Partial was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @partial.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partial.destroy
    respond_to do |format|
      format.html { redirect_to partials_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partial
      @partial = Partial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partial_params
      params.require(:partial).permit(:f_customer_id, :s_customer_id, :t_customer_id, :partial_html)
    end
end
