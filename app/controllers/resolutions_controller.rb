class ResolutionsController < ApplicationController
  before_action :set_company
  before_action :set_resolution, only: [:show, :edit, :update, :destroy]

  # GET /resolutions
  # GET /resolutions.json
  def index
    @resolutions = @company.resolutions.all
  end

  # GET /resolutions/1
  # GET /resolutions/1.json
  def show
  end

  # GET /resolutions/new
  def new
    @resolution = @company.resolutions.build
  end

  # GET /resolutions/1/edit
  def edit
  end

  # POST /resolutions
  # POST /resolutions.json
  def create
    @resolution = @company.resolutions.build(resolution_params)

    respond_to do |format|
      if @resolution.save
        format.html { redirect_to [@company, @resolution], notice: 'Resolution was successfully created.' }
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1
  # PATCH/PUT /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to [@company, @resolution], notice: 'Resolution was successfully updated.' }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { render :edit }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1
  # DELETE /resolutions/1.json
  def destroy
    @resolution.destroy
    respond_to do |format|
      format.html { redirect_to company_resolutions_url, notice: 'Resolution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_resolution
    @resolution = @company.resolutions.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resolution_params
    params.require(:resolution).permit(:company_id,
                                       :title,
                                       :doc_date,
                                       :description,
                                       :status,
                                       :party,
                                       :res_category,
                                       :res_type,
                                       :notes,
                                       :resolution_document)
  end
end
