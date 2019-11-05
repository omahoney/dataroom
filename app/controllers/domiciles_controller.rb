class DomicilesController < ApplicationController
  before_action :set_company
  before_action :set_domicile, only: [:show, :edit, :update, :destroy]

  # GET /domiciles
  # GET /domiciles.json
  def index
    @domiciles = @company.domiciles.all
  end

  # GET /domiciles/1
  # GET /domiciles/1.json
  def show
  end

  # GET /domiciles/new
  def new
    @domicile = @company.domiciles.build
  end

  # GET /domiciles/1/edit
  def edit
  end

  # POST /domiciles
  # POST /domiciles.json
  def create
    @domicile = @company.domiciles.build(domicile_params)

    respond_to do |format|
      if @domicile.save
        format.html { redirect_to [@company, @domicile], notice: 'Domicile was successfully created.' }
        format.json { render :show, status: :created, location: @domicile }
      else
        format.html { render :new }
        format.json { render json: @domicile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /domiciles/1
  # PATCH/PUT /domiciles/1.json
  def update
    respond_to do |format|
      if @domicile.update(domicile_params)
        format.html { redirect_to [@company, @domicile], notice: 'Domicile was successfully updated.' }
        format.json { render :show, status: :ok, location: @domicile }
      else
        format.html { render :edit }
        format.json { render json: @domicile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domiciles/1
  # DELETE /domiciles/1.json
  def destroy
    @domicile.destroy
    respond_to do |format|
      format.html { redirect_to company_domiciles_url, notice: 'Domicile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_domicile
    @domicile = @company.domiciles.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def domicile_params
    params.require(:domicile).permit(:company_id,
                                     :domicile_locus,
                                     :domicile_type,
                                     :domicile_number,
                                     :address,
                                     :city,
                                     :zip,
                                     :county,
                                     :state,
                                     :country,
                                     :agent,
                                     :notes,
                                     :domicile_document)
  end
end
