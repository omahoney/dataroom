class OfficersController < ApplicationController
  before_action :set_company
  before_action :set_officer, only: [:show, :edit, :update, :destroy]

  # GET /officers
  # GET /officers.json
  def index
    @officers = @company.officers.all
  end

  # GET /officers/1
  # GET /officers/1.json
  def show
  end

  # GET /officers/new
  def new
    @officer = @company.officers.build
  end

  # GET /officers/1/edit
  def edit
  end

  # POST /officers
  # POST /officers.json
  def create
    @officer = @company.officers.build(officer_params)

    respond_to do |format|
      if @officer.save
        format.html { redirect_to [@company, @officer], notice: 'Officer was successfully created.' }
        format.json { render :show, status: :created, location: @officer }
      else
        format.html { render :new }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /officers/1
  # PATCH/PUT /officers/1.json
  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to [@company, @officer], notice: 'Officer was successfully updated.' }
        format.json { render :show, status: :ok, location: @officer }
      else
        format.html { render :edit }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officers/1
  # DELETE /officers/1.json
  def destroy
    @officer.destroy
    respond_to do |format|
      format.html { redirect_to company_company_officers_url, notice: 'Officer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_officer
    @officer = @company.officers.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def officer_params
    params.require(:officer).permit(:company_id,
                                    :person_id,
                                    :resolution_id,
                                    :title,
                                    :jx_required,
                                    :notes,
                                    :officer_document)
  end
end
