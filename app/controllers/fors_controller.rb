class ForsController < ApplicationController
  before_action :set_for, only: [:show, :edit, :update, :destroy]

  # GET /fors
  # GET /fors.json
  def index
    @fors = For.all
  end

  # GET /fors/1
  # GET /fors/1.json
  def show
  end

  # GET /fors/new
  def new
    @for = For.new
  end

  # GET /fors/1/edit
  def edit
  end

  # POST /fors
  # POST /fors.json
  def create
    @for = For.new(for_params)

    respond_to do |format|
      if @for.save
        format.html { redirect_to @for, notice: 'For was successfully created.' }
        format.json { render :show, status: :created, location: @for }
      else
        format.html { render :new }
        format.json { render json: @for.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fors/1
  # PATCH/PUT /fors/1.json
  def update
    respond_to do |format|
      if @for.update(for_params)
        format.html { redirect_to @for, notice: 'For was successfully updated.' }
        format.json { render :show, status: :ok, location: @for }
      else
        format.html { render :edit }
        format.json { render json: @for.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fors/1
  # DELETE /fors/1.json
  def destroy
    @for.destroy
    respond_to do |format|
      format.html { redirect_to fors_url, notice: 'For was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_for
      @for = For.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def for_params
      params.require(:for).permit(:Developer, :null, :unique)
    end
end
