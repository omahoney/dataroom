class CompliancesController < ApplicationController
  before_action :set_company
  before_action :set_compliance, only: [:show, :edit, :update, :destroy]

  # GET /compliances
  # GET /compliances.json
  def index
    @compliances = @company.compliances.all
  end

  # GET /compliances/1
  # GET /compliances/1.json
  def show
  end

  # GET /compliances/new
  def new
    @compliance = @company.compliances.build
  end

  # GET /compliances/1/edit
  def edit
  end

  # POST /compliances
  # POST /compliances.json
  def create
    @compliance = @company.compliances.build(compliance_params)

    respond_to do |format|
      if @compliance.save
        format.html { redirect_to [@company, @compliance], notice: 'Compliance was successfully created.' }
        format.json { render :show, status: :created, location: @compliance }
      else
        format.html { render :new }
        format.json { render json: @compliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compliances/1
  # PATCH/PUT /compliances/1.json
  def update
    respond_to do |format|
      if @compliance.update(compliance_params)
        format.html { redirect_to [@company, @compliance], notice: 'Compliance was successfully updated.' }
        format.json { render :show, status: :ok, location: @compliance }
      else
        format.html { render :edit }
        format.json { render json: @compliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compliances/1
  # DELETE /compliances/1.json
  def destroy
    @compliance.destroy
    respond_to do |format|
      format.html { redirect_to company_compliances_url, notice: 'Compliance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_compliance
    @compliance = @company.compliances.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def compliance_params
    params.require(:compliance).permit(:company_id,
                                       :domicile_id,
                                       :title,
                                       :doc_date,
                                       :description,
                                       :status,
                                       :jurisdiction,
                                       :notes,
                                       :compliance_document)
  end
end
