class RunsController < ApplicationController
  before_action :set_run, only: [:show, :destroy, :update, :edit]
  before_action :set_experiment, only: [:new, :create, :update]

  def show
    @results = @run.results
  end

  def new
    @run = Run.new
  end

  def edit
  end

  def create
    @run = @experiment.runs.build(run_params)

    respond_to do |format|
      if @run.save
        format.html { redirect_to @experiment, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @run.update(run_params)
        format.html { redirect_to @run.experiment, notice: 'Run was successfully updated.' }
        format.json { render :show, status: :ok, location: @run}
      else
        format.html { render :edit }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @run.destroy
    respond_to do |format|
      format.html { redirect_to @run.experiment, notice: 'Run was suuccessfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_run
      @run = Run.find(params[:id])
    end

    def set_experiment
      @experiment = Experiment.find(params[:experiment_id])
    end

    def run_params
      params.require(:run).permit(:title, :description)
    end
end
