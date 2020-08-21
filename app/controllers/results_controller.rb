class ResultsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authorized, only: [:create]
  before_action :set_result, only: [:show, :edit, :update, :destroy]
  before_action :set_run, only: [:new, :show, :create]

  # GET /results/1
  # GET /results/1.json
  def show
  end

  # GET /results/new
  def new
    @result = Result.new
  end

  # # GET /results/1/edit
  # def edit
  # end

  # POST /results
  # POST /results.json
  def create
    @result = @run.results.build(uuid: params[:uuid], data: params[:data])

    respond_to do |format|
      if @result.save
        # format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created }
      else
        # format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /results/1
  # # PATCH/PUT /results/1.json
  # def update
  #   respond_to do |format|
  #     if @result.update(result_params)
  #       format.html { redirect_to @result, notice: 'Result was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @result }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @result.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result.destroy
    respond_to do |format|
      format.html { redirect_to results_url, notice: 'Result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    def set_run
      @run = Run.find(params[:run_id])
    end

end
