class ValuationsController < ApplicationController
  before_action :set_company
  before_action :set_valuation, only: [:show, :edit, :update, :destroy]

  # GET /valuations
  # GET /valuations.json
  def index
    @valuations = @company.valuations.all
  end

  # GET /valuations/1
  # GET /valuations/1.json
  def show
  end

  # GET /valuations/new
  def new
    @valuation = @company.valuations.build
  end

  # GET /valuations/1/edit
  def edit
  end

  # POST /valuations
  # POST /valuations.json
  def create
    @valuation = @company.valuations.build(valuation_params)

    respond_to do |format|
      if @valuation.save
        format.html { redirect_to [@company, @valuation], notice: 'Valuation was successfully created.' }
        format.json { render :show, status: :created, location: @valuation }
      else
        format.html { render :new }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valuations/1
  # PATCH/PUT /valuations/1.json
  def update
    respond_to do |format|
      if @valuation.update(valuation_params)
        format.html { redirect_to [@company, @valuation], notice: 'Valuation was successfully updated.' }
        format.json { render :show, status: :ok, location: @valuation }
      else
        format.html { render :edit }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valuations/1
  # DELETE /valuations/1.json
  def destroy
    @valuation.destroy
    respond_to do |format|
      format.html { redirect_to company_valuations_url, notice: 'Valuation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_valuation
    @valuation = @company.valuations.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def valuation_params
    params.require(:valuation).permit(:company_id,
                                      :stockplan_id,
                                      :title,
                                      :price,
                                      :event,
                                      :provider,
                                      :valuation_date,
                                      :safeharbor_date,
                                      :active,
                                      :notes,
                                      :valuation_document)
  end
end
