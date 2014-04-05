class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]  

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @categories = Category.all.select("CONCAT(id, '-', name) as value, name as label").to_json
	@query = ''
    @customer = Customer.new(is_active: true)
  end

  # GET /customers/1/edit
  def edit
	@categories = Category.all.select("CONCAT(id, '-', name) as value, name as label").to_json
	@query = Category.where("id IN (?)", @customer.category_ids).select("CONCAT(id, '-', name) as value").map(&:value).to_json
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
	params[:customer][:category_ids] = params[:customer][:categories_raw].values.map{|id| id.to_i} unless params[:customer][:categories_raw].nil?
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    params[:customer][:category_ids] = []
    params[:customer][:category_ids] = params[:customer][:categories_raw].values.map{|id| id.to_i} unless params[:customer][:categories_raw].nil?
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private  
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :webadress, :acc_type, :access_key, :is_active, :categories_raw, category_ids: [])
    end
end
