class DirectorsController < ApplicationController
  before_action :set_company
  before_action :set_director, only: [:show, :edit, :update, :destroy]

  # GET /directors
  # GET /directors.json
  def index
    @directors = @company.directors.all
  end

  # GET /directors/1
  # GET /directors/1.json
  def show
  end

  # GET /directors/new
  def new
    @director = @company.directors.build
  end

  # GET /directors/1/edit
  def edit
  end

  # POST /directors
  # POST /directors.json
  def create
    @director = @company.directors.build(director_params)

    respond_to do |format|
      if @director.save
        format.html { redirect_to [@company, @director], notice: 'Director was successfully created.' }
        format.json { render :show, status: :created, location: @director }
      else
        format.html { render :new }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directors/1
  # PATCH/PUT /directors/1.json
  def update
    respond_to do |format|
      if @director.update(director_params)
        format.html { redirect_to [@company, @director], notice: 'Director was successfully updated.' }
        format.json { render :show, status: :ok, location: @director }
      else
        format.html { render :edit }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directors/1
  # DELETE /directors/1.json
  def destroy
    @director.destroy
    respond_to do |format|
      format.html { redirect_to company_directors_url, notice: 'Director was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_director
    #@director = Director.find(params[:id])
    @director = @company.directors.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def director_params
    params.require(:director).permit(:company_id,
                                     :person_id,
                                     :resolution_id,
                                     :director_class,
                                     :term,
                                     :start_date,
                                     :notes,
                                     :director_document)
  end
end
