class DashboardsController < ApplicationController
  before_action :set_company
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  # GET /dashboards
  # GET /dashboards.json
  def index
    if params[:filter].nil?
      @dashboards = @company.dashboards.annual(Date.current.year)
    else
      if params[:filter] == "Annual" then @dashboards = @company.dashboards.annual(Date.current.year) end
      if params[:filter] == "Archive" then   @dashboards = @company.dashboards.all end
    end
    @officers = @company.officers.all
    @directors = @company.directors.all
    @domiciles = @company.domiciles.all
  end

  # GET /dashboards/1
  # GET /dashboards/1.json
  def show
  end

  # GET /dashboards/new
  def new
    @dashboard = @company.dashboards.build
  end

  # GET /dashboards/1/edit
  def edit
  end

  # POST /dashboards
  # POST /dashboards.json
  def create
    @dashboard = @company.dashboards.build(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to [@company, @dashboard], notice: 'Dashboard was successfully created.' }
        format.json { render :show, status: :created, location: [@company, @dashboard] }
      else
        format.html { render :new }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to [@company, @dashboard], notice: 'Dashboard was successfully updated.' }
        format.json { render :show, status: :ok, location: [@company, @dashboard] }
      else
        format.html { render :edit }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to company_dashboards_url, notice: 'Dashboard was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_dashboard
    @dashboard = @company.dashboards.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dashboard_params
    params.require(:dashboard).permit(:company_id,
                                      :description,
                                      :contact,
                                      :deadline,
                                      :completed,
                                      :notes)
  end
end
