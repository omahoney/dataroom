class FormationsController < ApplicationController
  before_action :set_company
  before_action :set_formation, only: [:show, :edit, :update, :destroy]

  # GET /formations
  # GET /formations.json
  def index
    @formations = @company.formations.all
  end

  # GET /formations/1
  # GET /formations/1.json
  def show
  end

  # GET /formations/new
  def new
    @formation = @company.formations.build
  end

  # GET /formations/1/edit
  def edit
  end

  # POST /formations
  # POST /formations.json
  def create
    @formation = @company.formations.build(formation_params)

    respond_to do |format|
      if @formation.save
        format.html { redirect_to [@company, @formation], notice: 'Formation was successfully created.' }
        format.json { render :show, status: :created, location: @formation }
      else
        format.html { render :new }
        format.json { render json: @formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formations/1
  # PATCH/PUT /formations/1.json
  def update
    respond_to do |format|
      if @formation.update(formation_params)
        format.html { redirect_to [@company, @formation], notice: 'Formation was successfully updated.' }
        format.json { render :show, status: :ok, location: @formation }
      else
        format.html { render :edit }
        format.json { render json: @formation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formations/1
  # DELETE /formations/1.json
  def destroy
    @formation.destroy
    respond_to do |format|
      format.html { redirect_to company_formations_url, notice: 'Formation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_formation
    @formation = @company.formations.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def formation_params
    params.require(:formation).permit(:company_id,
                                      :title,
                                      :doc_date,
                                      :description,
                                      :status,
                                      :notes,
                                      :formation_document)
  end
end
