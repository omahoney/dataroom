class OptionplansController < ApplicationController
  before_action :set_company
  before_action :set_optionplan, only: [:show, :edit, :update, :destroy]

  def dashboard
    @optionplans = @company.optionplans.all
  end

  # GET /optionplans
  # GET /optionplans.json
  def index
    @optionplans = @company.optionplans.all
  end

  # GET /optionplans/1
  # GET /optionplans/1.json
  def show
  end

  # GET /optionplans/new
  def new
    @optionplan = @company.optionplans.build
  end

  # GET /optionplans/1/edit
  def edit
  end

  # POST /optionplans
  # POST /optionplans.json
  def create
    @optionplan = @company.optionplans.build(optionplan_params)

    respond_to do |format|
      if @optionplan.save
        format.html { redirect_to [@company,@optionplan], notice: 'Optionplan was successfully created.' }
        format.json { render :show, status: :created, location: @optionplan }
      else
        format.html { render :new }
        format.json { render json: @optionplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /optionplans/1
  # PATCH/PUT /optionplans/1.json
  def update
    respond_to do |format|
      if @optionplan.update(optionplan_params)
        format.html { redirect_to [@company, @optionplan], notice: 'Optionplan was successfully updated.' }
        format.json { render :show, status: :ok, location: @optionplan }
      else
        format.html { render :edit }
        format.json { render json: @optionplan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /optionplans/1
  # DELETE /optionplans/1.json
  def destroy
    @optionplan.destroy
    respond_to do |format|
      format.html { redirect_to company_optionplans_url, notice: 'Optionplan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:company_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_optionplan
    @optionplan = @company.optionplans.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def optionplan_params
    params.require(:optionplan).permit(:company_id,
                                       :stockplan_id,
                                       :resolution_id,
                                       :plan_title,
                                       :plan_date,
                                       :shares_allocated,
                                       :notes,
                                       :optionplan_document)
  end
end
