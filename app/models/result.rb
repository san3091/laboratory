class Result < ApplicationRecord
  belongs_to :run
  validates :data, presence: true

  def system
    data["system"]
  end

  def subject_information
    data["subject_information"]
  end

  def time_in_minutes
    data["time_in_minutes"]
  end

  def trials
    data["trials"]
  end

  def headers
    trials.values.first.keys + system.keys + subject_information.keys + ["time_in_minutes"]
  end

end
