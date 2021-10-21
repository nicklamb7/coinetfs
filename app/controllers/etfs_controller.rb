class EtfsController < ApplicationController
  before_action :set_etf, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index new ]
  # GET /etfs or /etfs.json
  def index
    @etfs = Etf.all

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'etfs/list', locals: { etfs: @etfs }, formats: [:html] }
    end

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @etfs = Etf.where(sql_query, query: "%#{params[:query]}%")
    else
      @etfs = Etf.all
    end
  end

  # GET /etfs/1 or /etfs/1.json
  def show
  end

  # GET /etfs/new
  def new
    @etf = Etf.new
  end

  # GET /etfs/1/edit
  def edit
  end

  # POST /etfs or /etfs.json
  def create
    @etf = Etf.new(etf_params)

    respond_to do |format|
      if @etf.save
        format.html { redirect_to @etf, notice: "Etf was successfully created." }
        format.json { render :show, status: :created, location: @etf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etfs/1 or /etfs/1.json
  def update
    respond_to do |format|
      if @etf.update(etf_params)
        format.html { redirect_to @etf, notice: "Etf was successfully updated." }
        format.json { render :show, status: :ok, location: @etf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @etf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etfs/1 or /etfs/1.json
  def destroy
    @etf.destroy
    respond_to do |format|
      format.html { redirect_to etfs_url, notice: "Etf was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etf
      @etf = Etf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def etf_params
      params.require(:etf).permit(:name, :description, :asset_id)
    end
end
