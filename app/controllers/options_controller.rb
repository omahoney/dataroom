class OptionsController < ApplicationController
  before_action :set_company
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  def dashboard
    @optionplans = @company.optionplans.all
    @options = @company.options.all

    @options_active = @options.active
    @options_granted = @options_active.sum(:granted)
  end

  def optionholders
    @company = Company.find(params[:company_id])
    @optionplans = @company.optionplans.all
    @options = @company.options.all

    @options_active = @company.options.where('active = ?', TRUE)
    @num_options_active = @options_active.sum(:granted).to_i
    @optionholders = @options_active.select(:person_id, "SUM(granted) as sum_options_issued").group(:person_id)
    @num_optionholders = @options_active.select(:person_id).distinct.count.to_i
  end


  # GET /options
  # GET /options.json
  def index
    @options = @company.options.all
  end

  # GET /options/1
  # GET /options/1.json
  def show
  end

  # GET /options/new
  def new
    @option = @company.options.build
  end

  # GET /options/1/edit
  def edit
  end

  # POST /options
  # POST /options.json
  def create
    @option = @company.options.build(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to [@company, @option], notice: 'Option was successfully created.' }
        format.json { render :show, status: :created, location: @option }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /options/1
  # PATCH/PUT /options/1.json
  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to [@company, @option], notice: 'Option was successfully updated.' }
        format.json { render :show, status: :ok, location: @option }
      else
        format.html { render :edit }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /options/1
  # DELETE /options/1.json
  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to company_options_url, notice: 'Option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_option
    @option = @company.options.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def option_params
    params.require(:option).permit(:company_id,
                                   :person_id,
                                   :optionplan_id,
                                   :valuation_id,
                                   :resolution_id,
                                   :title,
                                   :grant_date,
                                   :option_type,
                                   :early_exercise,
                                   :vesting_term,
                                   :granted,
                                   :exercised,
                                   :fmv,
                                   :strike_price,
                                   :status,
                                   :forfeited,
                                   :canceled,
                                   :outstanding,
                                   :cliff,
                                   :active,
                                   :notes,
                                   :option_document)
  end
end
