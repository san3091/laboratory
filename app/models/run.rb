require 'csv'

class Run < ApplicationRecord
  belongs_to :experiment
  has_many :results, dependent: :destroy
  validates :title, presence: true

  def as_csv
    csv_string = CSV.generate(headers: true) do |csv|
      # generate headers from the first result
      csv << results.first.headers

      results.map do |result|
        # extract common attributes
        common_attributes = result.system
          .merge(result.subject_information)
          .merge({"time_in_minutes" => result.time_in_minutes})

        result.trials.each_value do |trial|
          row = trial.merge(common_attributes)
          csv << row.values
        end
      end
    end
  end

end
