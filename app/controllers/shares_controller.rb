class SharesController < ApplicationController
  before_action :set_company
  before_action :set_share, only: [:show, :edit, :update, :destroy]

  def newround
    @company = Company.find(params[:company_id])
    @stockplans = @company.stockplans.all
    @shares = @company.shares.all
    @options = @company.options.all
    @optionplans = @company.optionplans.all
    @convertiblenotes = @company.convertiblenotes.where(converted: FALSE)

    @shares_dilutive = @convertiblenotes.sum(:share_cap) + @optionplans.sum(:shares_allocated) - @options.sum(:exercised)
    @shares_diluted = @shares.where(active: true).sum(:shares_issued) + @shares_dilutive

    @newround = params[:newround]
    @pricepershare = params[:pricepershare]
    if @newround != nil
      @roundshares = @newround.to_f / @pricepershare.to_f
      @postshares = @roundshares + @shares_diluted
      @premoney = @shares_diluted * @pricepershare.to_f
      @postmoney = @postshares * @pricepershare.to_f
    end
  end

  def captable
    @company = Company.find(params[:company_id])
    @stockplans = @company.stockplans.all
    @shares = @company.shares.all
    @options = @company.options.all
    @optionplans = @company.optionplans.all
    @convertiblenotes = @company.convertiblenotes.where(converted: FALSE)

    @shares_active = @shares.active
    @shares_active_outstanding = @shares_active.sum(:shares_issued)

    @newround = params[:newround]
    @pricepershare = params[:pricepershare]
    if @newround != nil
      @roundshares = @newround.to_f / @pricepershare.to_f
      @postshares = @roundshares + @shares_diluted
      @premoney = @shares_diluted * @pricepershare.to_f
      @postmoney = @postshares * @pricepershare.to_f
    end
  end

  def dashboard
    @stockplans = @company.stockplans.all
    @shares = @company.shares.all

    @shares_active = @shares.active
    @shares_terminated = @shares.terminated
  end

  # GET /shares
  # GET /shares.json
  def index
    @shares = @company.shares.all
  end

  # GET /shares/1
  # GET /shares/1.json
  def show
  end

  # GET /shares/new
  def new
    @share = @company.shares.build
  end

  # GET /shares/1/edit
  def edit
  end

  # POST /shares
  # POST /shares.json
  def create
    @share = @company.shares.build(share_params)

    respond_to do |format|
      if @share.save
        format.html { redirect_to [@company, @share], notice: 'Share was successfully created.' }
        format.json { render :show, status: :created, location: @share }
      else
        format.html { render :new }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shares/1
  # PATCH/PUT /shares/1.json
  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to [@company, @share], notice: 'Share was successfully updated.' }
        format.json { render :show, status: :ok, location: @share }
      else
        format.html { render :edit }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to company_shares_url, notice: 'Share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_share
    @share = @company.shares.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def share_params
    params.require(:share).permit(:company_id,
                                  :person_id,
                                  :stockplan_id,
                                  :certificate,
                                  :shares_issued,
                                  :share_price,
                                  :cash,
                                  :issued_date,
                                  :restricted,
                                  :terminated_date,
                                  :domicile,
                                  :exemption,
                                  :reference,
                                  :status,
                                  :active,
                                  :notes,
                                  :share_document)
  end
end
