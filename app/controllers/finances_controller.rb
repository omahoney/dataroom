class FinancesController < ApplicationController
  before_action :set_company
  before_action :set_finance, only: [:show, :edit, :update, :destroy]

  # GET /finances
  # GET /finances.json
  def index
    @finances = @company.finances.all
  end

  # GET /finances/1
  # GET /finances/1.json
  def show
  end

  # GET /finances/new
  def new
    @finance = @company.finances.build
  end

  # GET /finances/1/edit
  def edit
  end

  # POST /finances
  # POST /finances.json
  def create
    @finance = @company.finances.build(finance_params)

    respond_to do |format|
      if @finance.save
        format.html { redirect_to [@company, @finance], notice: 'Finance was successfully created.' }
        format.json { render :show, status: :created, location: @finance }
      else
        format.html { render :new }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /finances/1
  # PATCH/PUT /finances/1.json
  def update
    respond_to do |format|
      if @finance.update(finance_params)
        format.html { redirect_to [@company, @finance], notice: 'Finance was successfully updated.' }
        format.json { render :show, status: :ok, location: @finance }
      else
        format.html { render :edit }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /finances/1
  # DELETE /finances/1.json
  def destroy
    @finance.destroy
    respond_to do |format|
      format.html { redirect_to company_finances_url, notice: 'Finance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_finance
    @finance = @company.finances.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def finance_params
    params.require(:finance).permit(:company_id,
                                    :person_id,
                                    :stockplan_id,
                                    :title,
                                    :doc_date,
                                    :description,
                                    :category,
                                    :status,
                                    :active,
                                    :complete,
                                    :notes,
                                    :finance_document)
  end
end

