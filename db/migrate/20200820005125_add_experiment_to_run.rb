class AddExperimentToRun < ActiveRecord::Migration[6.0]
  def change
    add_reference :runs, :experiment, foreign_key: true
  end
end
