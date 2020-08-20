class RunsController < ApplicationController
  before_action :set_run, only: [:show, :destroy]
  before_action :set_experiment, only: [:new, :create]

  def show
  end

  def new
    @run = Run.new
  end

  def create
    @run = Run.new(run_params)

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
      params.require(:run).permit(:title, :description).merge(experiment: @experiment)
    end
end
