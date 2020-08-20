class RunsController < ApplicationController
  before_action :set_run, only: [:show]
  before_action :set_experiment, only: [:new]

  def show
  end

  def new
    @run = Run.new
  end

  def create
    @run = Run.new(run_params)

    respond_to do |format|
      if @run.save
        format.html { redirect_to @run, notice: 'Run was successfully created.' }
        format.json { render :show, status: :created, location: @run }
      else
        format.html { render :new }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
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
      params.require(:run).permit(:title)
    end
end
