class StockholdersController < ApplicationController
  before_action :set_company
  before_action :set_stockholder, only: [:show, :edit, :update, :destroy]

  # GET /stockholders
  # GET /stockholders.json
  def index
    @stockholders = @company.stockholders.all
  end

  # GET /stockholders/1
  # GET /stockholders/1.json
  def show
  end

  # GET /stockholders/new
  def new
    @stockholder = @company.stockholders.build
  end

  # GET /stockholders/1/edit
  def edit
  end

  # POST /stockholders
  # POST /stockholders.json
  def create
    @stockholder = @company.stockholders.build(stockholder_params)

    respond_to do |format|
      if @stockholder.save
        format.html { redirect_to [@company, @stockholder], notice: 'Stockholder was successfully created.' }
        format.json { render :show, status: :created, location: @stockholder }
      else
        format.html { render :new }
        format.json { render json: @stockholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stockholders/1
  # PATCH/PUT /stockholders/1.json
  def update
    respond_to do |format|
      if @stockholder.update(stockholder_params)
        format.html { redirect_to [@company, @stockholder], notice: 'Stockholder was successfully updated.' }
        format.json { render :show, status: :ok, location: @stockholder }
      else
        format.html { render :edit }
        format.json { render json: @stockholder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stockholders/1
  # DELETE /stockholders/1.json
  def destroy
    @stockholder.destroy
    respond_to do |format|
      format.html { redirect_to stockholders_url, notice: 'Stockholder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_stockholder
    @stockholder = @company.stockholders.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stockholder_params
    params.require(:stockholder).permit(:company_id,
                                        :person_id,
                                        :active,
                                        :status,
                                        :notes,
                                        :stockholder_document)
  end
end
