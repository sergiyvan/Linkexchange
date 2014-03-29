class KnownUrlsController < ApplicationController
  before_action :set_known_url, only: [:show, :edit, :update, :destroy]

  # GET /known_urls
  # GET /known_urls.json
  def index
    @known_urls = KnownUrl.all
  end

  # GET /known_urls/1
  # GET /known_urls/1.json
  def show
  end

  # GET /known_urls/new
  def new
    @known_url = KnownUrl.new
  end

  # GET /known_urls/1/edit
  def edit
  end

  # POST /known_urls
  # POST /known_urls.json
  def create
    @known_url = KnownUrl.new(known_url_params)

    respond_to do |format|
      if @known_url.save
        format.html { redirect_to @known_url, notice: 'Known url was successfully created.' }
        format.json { render action: 'show', status: :created, location: @known_url }
      else
        format.html { render action: 'new' }
        format.json { render json: @known_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /known_urls/1
  # PATCH/PUT /known_urls/1.json
  def update
    respond_to do |format|
      if @known_url.update(known_url_params)
        format.html { redirect_to @known_url, notice: 'Known url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @known_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /known_urls/1
  # DELETE /known_urls/1.json
  def destroy
    @known_url.destroy
    respond_to do |format|
      format.html { redirect_to known_urls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_known_url
      @known_url = KnownUrl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def known_url_params
      params.require(:known_url).permit(:url, :customer_id, :partial_id)
    end
end
