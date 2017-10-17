class SitesController < ApplicationController
  before_action :set_site, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /sites.json
  def index
    @sites = Site.get_all
    render json: @sites.to_json
  end

  # GET /sites/1.json
  def show
    respond_to do |format|
      format.json { render json: @site.obj }
    end
  end

  # POST /sites.json
  def create
    @site = Site.new(site_params)

    if @site.save
      render json: @site.obj
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sites/1.json
  def destroy
    if @site.destroy
      head :no_content
    else
      render json: @site.errors, status: :not_destroyed
    end
  end

  # PATCH/PUT /sites/1.json
  def update
    if @site.update(user_params)
      render json: @site.obj
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_site
    @user = Site.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit( :name, :max_accounts )
  end
end
