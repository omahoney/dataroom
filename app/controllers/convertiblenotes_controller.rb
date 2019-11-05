class ConvertiblenotesController < ApplicationController
  before_action :set_company
  before_action :set_convertiblenote, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @convertiblenotes = @company.convertiblenotes.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @convertiblenote = @company.convertiblenotes.build
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @convertiblenote = @company.convertiblenotes.build(convertiblenote_params)

    respond_to do |format|
      if @convertiblenote.save
        format.html { redirect_to [@company, @convertiblenote], notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @convertiblenote }
      else
        format.html { render :new }
        format.json { render json: @convertiblenote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @convertiblenote.update(convertiblenote_params)
        format.html { redirect_to [@company, @convertiblenote], notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @convertiblenote }
      else
        format.html { render :edit }
        format.json { render json: @convertiblenote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @convertiblenote.destroy
    respond_to do |format|
      format.html { redirect_to company_convertiblenotes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_convertiblenote
    @convertiblenote = @company.convertiblenotes.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def convertiblenote_params
    params.require(:convertiblenote).permit(:company_id,
                                            :person_id,
                                            :stockplan_id,
                                            :agreement_date,
                                            :note_date,
                                            :note_amount,
                                            :note_type,
                                            :maturity_date,
                                            :interest_rate,
                                            :discount_rate,
                                            :share_cap,
                                            :qualified_finance,
                                            :conversion_date,
                                            :converted,
                                            :status,
                                            :active,
                                            :notes,
                                            :convertiblenote_document)
  end
end
