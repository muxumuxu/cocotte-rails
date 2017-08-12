class FoodRisksController < ApplicationController
  before_action :set_food_risk, only: [:show, :edit, :update, :destroy]

  # GET /food_risks
  # GET /food_risks.json
  def index
    @food_risks = FoodRisk.all
  end

  # GET /food_risks/1
  # GET /food_risks/1.json
  def show
  end

  # GET /food_risks/new
  def new
    @food_risk = FoodRisk.new
  end

  # GET /food_risks/1/edit
  def edit
  end

  # POST /food_risks
  # POST /food_risks.json
  def create
    @food_risk = FoodRisk.new(food_risk_params)

    respond_to do |format|
      if @food_risk.save
        format.html { redirect_to @food_risk, notice: 'Food risk was successfully created.' }
        format.json { render :show, status: :created, location: @food_risk }
      else
        format.html { render :new }
        format.json { render json: @food_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_risks/1
  # PATCH/PUT /food_risks/1.json
  def update
    respond_to do |format|
      if @food_risk.update(food_risk_params)
        format.html { redirect_to @food_risk, notice: 'Food risk was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_risk }
      else
        format.html { render :edit }
        format.json { render json: @food_risk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_risks/1
  # DELETE /food_risks/1.json
  def destroy
    @food_risk.destroy
    respond_to do |format|
      format.html { redirect_to food_risks_url, notice: 'Food risk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_risk
      @food_risk = FoodRisk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_risk_params
      params.require(:food_risk).permit(:name, :url)
    end
end
