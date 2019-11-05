class StockplansController < ApplicationController
  before_action :set_company
  before_action :set_stockplan, only: [:show, :edit, :update, :destroy]

  def dashboard
    @stockplans = @company.stockplans.all
  end

  # GET /stockplans
  # GET /stockplans.json
  def index
    @stockplans = @company.stockplans.all
  end

  # GET /stockplans/1
  # GET /stockplans/1.json
  def show
  end

  # GET /stockplans/new
  def new
    @stockplan = @company.stockplans.build
  end

  # GET /stockplans/1/edit
  def edit
  end

  # POST /stockplans
  # POST /stockplans.json
  def create
    @stockplan = @company.stockplans.build(stockplan_params)

    respond_to do |format|
      if @stockplan.save
        format.html { redirect_to [@company, @stockplan], notice: 'Stockplan was successfully created.' }
        format.json { render :show, status: :created, location: @stockplan }
      else
        format.html { render :new }
        format.json { render json: @stockplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockplans/1
  # PATCH/PUT /stockplans/1.json
  def update
    respond_to do |format|
      if @stockplan.update(stockplan_params)
        format.html { redirect_to [@company, @stockplan], notice: 'Stockplan was successfully updated.' }
        format.json { render :show, status: :ok, location: @stockplan }
      else
        format.html { render :edit }
        format.json { render json: @stockplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockplans/1
  # DELETE /stockplans/1.json
  def destroy
    @stockplan.destroy
    respond_to do |format|
      format.html { redirect_to company_stockplans_url, notice: 'Stockplan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_stockplan
    @stockplan = @company.stockplans.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stockplan_params
    params.require(:stockplan).permit(:company_id,
                                      :resolution_id,
                                      :stock_class,
                                      :series,
                                      :date_authorized,
                                      :par_value,
                                      :shares_authorized,
                                      :shares_issuable,
                                      :shares_reserved,
                                      :rights,
                                      :status,
                                      :active,
                                      :notes,
                                      :stockplan_document)
  end
end
